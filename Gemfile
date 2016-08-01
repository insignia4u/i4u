source 'https://rubygems.org'

ruby '2.3.0'

# Rails
gem 'rails', '5.0'

# # Plugins
gem 'kaminari'
gem 'friendly_id'
gem 'paperclip'
gem 'textilize'
gem 'mobile-fu'
gem 'dalli'
gem 'virtus'
gem 'decent_exposure'
gem 'spectator-validates_email', require: 'validates_email'
gem 'fullcalendar-rails'
gem 'recaptcha'
gem 'figaro'


# Engines
gem 'devise',              github: 'plataformatec/devise'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'ransack',             github: 'activerecord-hackery/ransack'
gem 'draper',              '> 3.x'
gem 'sass-rails'
gem 'activeadmin', github: 'activeadmin'

# 3rd Party services
gem 'aws-sdk'
gem 'fog'
gem 'rollbar'
gem 'oj'
gem 'newrelic_rpm'
gem 'gibbon'
gem 'memcachier'


# Development Tools
group :development do
  gem 'spring'
end

# Test Suite
group :development, :test do
  gem 'rspec'
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'simplecov'
end

# Frontend
gem 'jquery-rails'
gem 'slim-rails'
gem 'font-awesome-rails'

group :assets do
  gem 'coffee-rails'
  gem 'compass-rails'
  gem 'uglifier'
  gem 'bourbon'
  gem 'neat'
end

# Production
group :production do
  gem 'pg'
  gem 'thin'
  gem 'rails_12factor'
  gem 'rack-timeout'
end
