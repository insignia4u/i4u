require 'simplecov'
SimpleCov.start 'rails' do
  add_filter "/admin/"
end

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require "paperclip/matchers"
require 'database_cleaner'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Paperclip::Shoulda::Matchers
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers, type: :feature
  config.include IntegrationHelpers
  config.include Devise::TestHelpers,     type: :controller
  config.extend  ControllerMacros,        type: :controller

  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
    ActionMailer::Base.deliveries.clear
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
