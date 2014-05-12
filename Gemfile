source 'https://rubygems.org'

# Ruby
ruby '2.0.0', patchlevel: '247'

# Rails
gem 'rails', '4.0.5'

# Setup
gem 'figaro'

# Frontend
gem 'tilt', '~> 1.1'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'sass'
gem 'sass-rails', '4.0.3'
gem 'coffee-rails'
gem 'compass-rails'
gem 'uglifier'
gem 'bourbon'
gem 'neat'
gem 'slim-rails'

# Engines
gem 'devise'
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'polyamorous', github: 'activerecord-hackery/polyamorous'
gem 'ransack',     github: 'activerecord-hackery/ransack'
gem 'formtastic',  github: 'justinfrench/formtastic'

# Plugins
gem 'kaminari'
gem 'friendly_id'
gem 'paperclip'
gem 'textilize'
gem 'mobile-fu'
gem 'draper'
gem 'gibbon'
gem 'virtus'
gem 'acts-as-taggable-on'

# 3rd Party Services
gem 'aws-sdk'
gem 'airbrake'
gem 'newrelic_rpm'

# Cache
gem 'dalli'
gem 'memcachier'

# Development Tools
group :development do
  gem 'taps',                '0.3.24'
  gem 'populator'
  gem 'quiet_assets'
  gem 'mailcatcher'
end

# Test Suite
group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem 'capybara'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'simplecov'
end

# Production
group :production do
  gem 'pg'
  gem 'thin'
end

# Misc
group :doc do
  gem 'sdoc', require: false
end
