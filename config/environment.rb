# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
LunchBot::Application.initialize!

# OMG deprecation warnings: SO ANNOYING
ActiveSupport::Deprecation.silenced = true
