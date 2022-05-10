require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    config.load_defaults 7.0

    config.autoload_paths += Dir.glob("#{config.root}/lib")
  end
end
