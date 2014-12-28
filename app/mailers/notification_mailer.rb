class NotificationMailer < ActionMailer::Base
  default from: "info@suitfabrik.com"

  def message_email(msg)
    @message = msg
    mail(to:      "info@suitfabrik.com",
         subject: "[SuitFabrik::New Message] New Message from #{@message.name}")
  end
end
