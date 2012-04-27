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

  def invitation(userTo, conference)
    @userTo = userTo
    @conference = conference
    mail(:to => @userTo.email, :subject => "CMUConnect Conference Invitation")
  end

  def text_alert(userTo, conference)
    @userTo = userTo
    @conference = conference
    mail(:to => "#{@userTo.phone}@#{@userTo.get_carrier_email}", :subject => "CMUConnect")
  end
end
