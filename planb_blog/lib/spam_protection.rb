class SpamProtection

  IP_RBLS = [ 'opm.blitzed.us', 'bsb.empty.us' ]
  HOST_RBLS = [ 'multi.surbl.org', 'bsb.empty.us' ]
  SECOND_LEVEL = [ 'co', 'com', 'net', 'org', 'gov' ]

  attr_accessor :this_blog

  def initialize(a_blog)
    self.this_blog = a_blog
  end

  def article_closed?(record)
    return false if this_blog.sp_article_auto_close.zero? or not record.new_record?

    if record.article.published_at.to_i < this_blog.sp_article_auto_close.days.ago.to_i
      logger.info("[SP] Blocked interaction with #{record.article.title}")
      return true
    end
  end

  def is_spam?(string)
    return false unless this_blog.sp_global
    return false if string.blank?

    reason = catch(:hit) do
      case string
        when Format::IP_ADDRESS: self.scan_ip(string)
        when Format::HTTP_URI: self.scan_uris(string) rescue URI::InvalidURIError
        else self.scan_text(string)
      end
    end

    if reason
      logger.info("[SP] Hit: #{reason}")
      return true
    end
  end

  protected

  def scan_ip(ip_address)
    logger.info("[SP] Scanning IP #{ip_address}")
    query_rbls(IP_RBLS, ip_address.split('.').reverse.join('.'))
  end

  def scan_text(string)
    uri_list = string.scan(/(http:\/\/[^\s"]+)/m).flatten

    check_uri_count(uri_list)
    check_against_blacklist(string)
    scan_uris(uri_list)

    return false
  end

  def check_against_blacklist(text)
    # Pattern scanning
    BlacklistPattern.find(:all).each do |pattern|
      logger.info("[SP] Scanning for #{pattern.class} #{pattern.pattern}")

      throw :hit, "#{pattern} matched" if pattern.matches?(text)
    end
  end

  def check_uri_count(uris)
    limit = this_blog.sp_url_limit
    return if limit.to_i.zero?
    if uris.size > limit
      throw :hit, "Hard URL Limit hit: #{uris.size} > #{limit}"
    end
  end

  def scan_uris(uris = [])
    uris.each do |uri|
      host = URI.parse(uri).host rescue next
      return scan_ip(host) if host =~ Format::IP_ADDRESS

      host_parts = host.split('.').reverse
      domain = Array.new

      # Check for two level TLD
      (SECOND_LEVEL.include?(host_parts[1]) ? 3:2).times do
        domain.unshift(host_parts.shift)
      end

      logger.info("[SP] Scanning domain #{domain.join('.')}")
      query_rbls(HOST_RBLS, host, domain.join('.'))
      logger.info("[SP] Finished domain scan #{domain.join('.')}")
      return false
    end
  end

  def query_rbls(rbls, *subdomains)
    rbls.each do |rbl|
      subdomains.uniq.each do |d|
        begin
          response = IPSocket.getaddress([d, rbl].join('.'))
          if response =~ /^127\.0\.0\./
            throw :hit,
              "#{rbl} positively resolved subdomain #{d} => #{response}"
          end
        rescue SocketError
          # NXDOMAIN response => negative:  d is not in RBL
        end
      end
    end
    return false
  end

  def logger
    @logger ||= RAILS_DEFAULT_LOGGER || Logger.new(STDOUT)
  end
end

module ActiveRecord
  module Validations
    module ClassMethods
      def validates_against_spamdb(*attr_names)
        configuration = { :message => "blocked by SpamProtection" }
        configuration.update(attr_names.pop) if attr_names.last.is_a?(Hash)

        validates_each(attr_names, configuration) do |record, attr_name, value|
          record.errors.add(attr_name, configuration[:message]) if SpamProtection.new(record.blog).is_spam?(value)
        end
      end
      def validates_age_of(*attr_names)
        configuration = { :on => :create, :message => "points to an item that is no longer available for interaction"}
        configuration.update(attr_names.pop) if attr_names.last.is_a?(Hash)

        validates_each(attr_names, configuration) do |record, attr_name, value|
          next unless value.to_i > 0
          record.errors.add(attr_name, configuration[:message]) if SpamProtection.new(record.blog).article_closed?(record)
        end
      end
    end
  end
end
