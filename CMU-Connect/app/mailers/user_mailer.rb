class UserMailer < ActionMailer::Base
  default from:  "meetupisproject@gmail.com"

  def exchange(userTo, userFrom)
    @userTo = userTo
    @userFrom = userFrom
    mail(:to => @userTo.email, :subject => "CMUConnect Contact Information")
  end

  def password_reset(email,password)
    @email = email
    @password = password
    mail(:to => @email, :subject => "CMU Password Reset")
  end
end
