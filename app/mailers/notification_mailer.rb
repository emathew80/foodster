class NotificationMailer < ActionMailer::Base
  default from: "no-reply@foodsterapp.com"

  def comment_added(comment)
    @place = comment.place
    @place_owner = @place.user
    mail(to: @place_owner.email, subject: "Sweet! Someone added a comment on #{@place.name}")

  end
    
end
