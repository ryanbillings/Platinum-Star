class UserMailer < ActionMailer::Base
  default from:  "meetupisproject@gmail.com"

  def exchange(userTo, userFrom)
    @userTo = userTo
    @userFrom = userFrom
    mail(:to => @userTo.email, :subject => "CMUConnect Contact Information")
  end

end
