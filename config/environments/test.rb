I4u::Application.configure do
  config.cache_classes = false
  config.serve_static_assets = false
  config.static_cache_control = "public, max-age=3600"
  config.whiny_nils = true
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_dispatch.show_exceptions = false
  config.action_controller.allow_forgery_protection    = false
  config.action_mailer.delivery_method = :test
  config.active_record.mass_assignment_sanitizer = :strict
  config.active_support.deprecation = :stderr
  ENV['RECAPTCHA_PUBLIC_KEY'] = 'PUBLICKEYHERE'
  ENV['RECAPTCHA_PRIVATE_KEY'] = 'PRIVATEKEYHERE'
end
