module ContentState
  class PresumedHam < Base
    include Singleton

    def enter_hook(content)
      super
      content[:published] = true
      content[:status_confirmed] = false
    end

    def published?(content)
      true
    end

    def withdraw(content)
      mark_as_spam(content)
    end

    def confirm_classification(content)
      mark_as_ham(content)
    end

    def mark_as_ham(content)
      content.state = Factory.new(:ham)
      true
    end

    def to_s
      'Ham?'
    end
    
    def send_notifications(content) 
      content.interested_users.each do |user| 
        content.send_notification_to_user(user) 
      end
    end   
  end
end
