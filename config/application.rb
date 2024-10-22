require_relative "boot"

require "rails/all"
require './app/middlewares/set_locale_middleware'
require './app/middlewares/rate_limiter'

Bundler.require(*Rails.groups)

module ArmsWebapp
  class Application < Rails::Application
    config.load_defaults 7.0
    config.active_job.queue_adapter = :sidekiq
    config.generators.template_engine = :slim
    config.i18n.available_locales = [:ru, :en]
    config.i18n.default_locale = :ru

    config.middleware.use SetLocaleMiddleware
    config.middleware.use RateLimiter
  end
end
