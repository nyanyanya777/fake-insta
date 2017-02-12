require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module FakeInsta
  class Application < Rails::Application

    config.i18n.default_locale = :ja

    config.active_record.raise_in_transactional_callbacks = true
    config.action_view.field_error_proc = proc { |html_tag, _| html_tag }
  end
end
