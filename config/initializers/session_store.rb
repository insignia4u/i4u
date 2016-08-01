if Rails.env.production? || Rails.env.staging?
  require 'action_dispatch/middleware/session/dalli_store'
  Rails.application.config.session_store :dalli_store
end
