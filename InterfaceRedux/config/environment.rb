# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :user_name => "brandinui@gmail.com",
  :password => "TWpe757ElMkJuzQ12sjjSA",
  :port => 587,
  :address => "smtp.mandrillapp.com",
  :authentication => :plain,
  :enable_starttls_auto => true
}
