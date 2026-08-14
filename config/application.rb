require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"

Bundler.require(*Rails.groups)

module TodoManager
  class Application < Rails::Application
    config.load_defaults 7.2

    config.autoload_lib(ignore: %w[assets tasks])

    config.generators.system_tests = nil
    config.time_zone = "Paris"
    config.i18n.default_locale = :fr

    # Domain-Driven / Feature-Based Architecture paths
    domain_paths = Dir[Rails.root.join("app", "domains", "*", "{models,controllers,services,queries,policies,helpers}")]
    config.autoload_paths += domain_paths
    config.eager_load_paths += domain_paths
    config.paths["app/views"].unshift(*Dir[Rails.root.join("app", "domains", "*", "views")])
  end
end
