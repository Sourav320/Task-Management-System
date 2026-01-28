require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module TaskManager
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Rails 7 way to autoload lib/
    config.autoload_paths << Rails.root.join("lib")

    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
