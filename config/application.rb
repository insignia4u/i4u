require File.expand_path('../boot', __FILE__)

require 'rails/all'
Bundler.require(:default, Rails.env)

module I4u
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.assets.initialize_on_precompile = false
    config.assets.enabled = true
    config.assets.version = '1.0'
    Slim::Engine.set_default_options :pretty => true
  end
end
