Airbrake.configure do |config|
  
  # support only production environment
  if Rails.env.production?
    config.api_key = "198e712fccbff2c66b0f4ae1384a2074"
  end

  config.host    = 'insignia-errbit.herokuapp.com'
  config.port    = 80
  config.secure  = config.port == 443

  # capture rake exceptions
  config.rescue_rake_exceptions = true
end