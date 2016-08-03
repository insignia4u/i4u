if Rails.env.production? || Rails.env.staging?
  Rails.application.config.session_store ActionDispatch::Session::CacheStore
end
