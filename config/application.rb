require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tmp05
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.generators do |g|
      g.template_engine :slim
    end    

    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)

    config.autoload_paths += %W(#{config.root}/lib)


    # Compiler options
    config.opal.method_missing      = true
    config.opal.optimized_operators = true
    config.opal.arity_check         = false
    config.opal.const_missing       = true
    config.opal.dynamic_require_severity = :ignore

    # Enable/disable /opal_specs route
    config.opal.enable_specs = true

    # The path to opal specs from Rails.root
    config.opal.spec_location = 'spec-opal'

  end
end
