require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ror
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    ContentfulModel.configure do |config|
      config.access_token = Rails.application.credentials[:contentful_access_token]
      config.space = Rails.application.credentials[:contentful_space_id]
      config.environment = Rails.application.credentials[:contentful_env_id]
    end
  end
end
