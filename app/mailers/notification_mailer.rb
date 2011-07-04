class NotificationMailer < ActionMailer::Base
  default :from => "example@example.org"

  def confirm_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => user.email,
         :subject => "Welcome to My Awesome Site")
  end

end
