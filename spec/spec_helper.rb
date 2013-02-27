ENV["RAILS_ENV"] ||= 'test'
ENV["NEW_RELIC_API_KEY"] = '9999'
ENV["NEW_RELIC_APPLICATION_NAME"] = 'test-production'
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl_rails'
require 'forgery'
require 'pry'

Rails.backtrace_cleaner.remove_silencers!
# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  config.before(:each) do
    if example.metadata[:type] == :feature || example.metadata[:stub_new_relic]
      NewRelicRequests.stub!
    end
  end
end

def sign_in_admin
  admin = FactoryGirl.create(:admin)
  visit root_path
  page.click_on 'Sign In'
  page.fill_in 'admin_email', with: admin.email
  page.fill_in 'admin_password', with: admin.password
  click_on 'Sign in'
  admin
end