class NotificationMailer < ActionMailer::Base
  default from: "no-reply@foodsterapp.com"

  def comment_added
    mail(to: "emathew.dev@gmail.com", subject: "Sweet! Someone added a comment to your place!")
  end
    
end
