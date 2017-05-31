require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Directory
  class Application < Rails::Application
    # Custom generator to skip tests, assets, helper and stylesheet
    config.generators do |g|
      g.test_framework nil
      g.assets false
      g.helper false
      g.stylesheets false
    end

    config.action_mailer.default_url_options = {
      host: ENV.fetch('BASE_URL', 'http://localhost:3000')
    }

    config.active_job.queue_adapter = :sidekiq
    config.secret_key_base = '<%= ENV["SECRET_KEY_BASE"] %>'
  end
end
