class NotificationMailer < ActionMailer::Base
  default from: "llleelay@gmail.com"

  def message_email(msg)
    @message = msg
    mail(to:      'llleelay@gmail.com',
         subject: "[SuitFabrik::New Message] New Message from #{@message.name}")
  end
end
