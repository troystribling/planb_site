class UserMailer < ActionMailer::Base

  def signup(user, domain, sent_at = Time.now)
    @subject    = 'Welcome to the Plan-B Discussion Forum'
    @body       = {:user => user, :domain => domain}
    @recipients = user.email
    @from       = 'beast@' + domain.split(":").first
    @sent_on    = sent_at
    @headers    = {}
  end
  
end