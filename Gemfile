source 'https://rubygems.org'

ruby '1.9.3', patchlevel: '545'

# Rails
gem 'rails', '3.2.18'

# Plugins
gem 'kaminari',             '0.15.0'
gem 'friendly_id',          '4.0.9'
gem 'paperclip',            '3.3.1'
gem 'textilize'
gem 'mobile-fu',            '1.1.1'
gem 'draper',               '0.18.0'
gem 'dalli',                '2.6.0'
gem 'strong_parameters',    '0.2.0'
gem 'virtus'
gem 'decent_exposure'
gem 'spectator-validates_email', require: 'validates_email'
gem 'jquery-cookie-rails'
gem 'fullcalendar-rails'
gem 'recaptcha',             :require => 'recaptcha/rails'
gem 'figaro'


# Engines
gem 'devise',               '2.1.0'
gem 'inherited_resources',  '1.3.1'  #fixed because the latest version is not compatible with activeadmin
gem 'activeadmin',          '0.4.4'

# 3rd Party services
gem 'aws-sdk',              '1.7.1'
gem 'rollbar',              '2.4.0'
gem 'oj',                   '2.12.14'
gem 'newrelic_rpm',         '3.5.3.25'
gem 'gibbon',               '0.4.2'
gem 'memcachier'


# Development Tools
group :development do
  gem 'taps',                '0.3.24'
  gem 'populator'
  gem 'quiet_assets'
  gem "spring-commands-rspec"
  gem 'spring'
  gem 'mailcatcher'
end

# Test Suite
group :development, :test do
  gem 'rspec',              '2.14.1'
  gem 'sqlite3'
  gem 'rspec-rails',        '2.14.2'
  gem 'factory_girl_rails', '3.4.0'
  gem 'faker',              '1.0.1'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'shoulda-matchers',    '1.4.2'
  gem 'database_cleaner',    '0.9.1'
  gem 'launchy'
  gem 'simplecov'
end

# Frontend
gem 'jquery-rails', '2.0.2'
gem 'slim-rails',   '1.0.3'

group :assets do
  gem 'sass', '~> 3.2.5'
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'compass-rails'
  gem 'uglifier'
  gem 'bourbon', '~> 2.1.2'
  gem 'neat', '~> 1.0.2'
end

# Production
group :production do
  gem 'pg'
  gem 'thin'
  gem 'rails_12factor'
  gem 'rack-timeout'
end
