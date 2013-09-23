ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "localhost",
  :user_name            => "alexandreedaoud@gmail.com",
  :password             => "alexinyear10",
  :authentication       => "plain",
  :enable_starttls_auto => true
}