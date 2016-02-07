require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Fnf
  class Application < Rails::Application
    config.i18n.enforce_available_locales = true
    config.active_record.raise_in_transactional_callbacks = true
    config.autoload_paths += %W(#{config.root}/app/models/people)
  end
end

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
