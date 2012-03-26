ActionMailer::Base.smtp_settings = {
  :address					=> "smtp.gmail.com",
  :port						=> 587,
  :user_name				=> "meetupisproject",
  :password					=> "ISROCKS!",
  :authentication			=> "plain",
  :enable_starttls_auto     => true
}
