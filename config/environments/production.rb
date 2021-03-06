# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

# Use a different logger for distributed setups
# config.logger = SyslogLogger.new

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true
config.action_view.cache_template_loading            = true

# Use a different cache store in production
# config.cache_store = :mem_cache_store

# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host                  = "http://assets.example.com"

# Disable delivery errors, bad email addresses will be ignored
# config.action_mailer.raise_delivery_errors = false

APPLICATION_HOST_NAME = 'theballot.org'
APPLICATION_C3_DOMAIN = 'nonpartisan.theballot.org'
APPLICATION_STANDARD_DOMAIN = 'theballot.org'

ActionController::Base.session_options[:session_domain] = '.theballot.org'

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  :domain             => "theballot.com",
  :perform_deliveries => true,
  :address            => 'smtp.sendgrid.net',
  :user_name          => 'cooper@radicaldesigns.org',
  :password           => 'v0t30rd13',
  :authentication     => :plain,
  :port               => 25 
}

config.action_controller.session_store = :mem_cache_store 
