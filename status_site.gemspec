$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem"s version:
require "status_site/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "status_site"
  s.version     = StatusSite::VERSION
  s.authors     = ["Think Through Math"]
  s.email       = ["jwrubel@thinkthroughmath.com"]
  s.homepage    = "http://thinkthroughmath.com"
  s.summary     = "Status site engine"
  s.description = "Let everyone know the status of your site."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.required_ruby_version = "2.0.0"

  s.add_dependency "rails", "~> 4.0.0.beta1"
  s.add_dependency "draper", "~> 1.0"
  s.add_dependency "slim"
  s.add_dependency "slim-rails"
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-ui-rails"
  s.add_dependency "newrelic_api"
  s.add_dependency "rails-observers"
  s.add_dependency "turbolinks"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "slim"
  s.add_development_dependency "slim-rails"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "webmock"
  s.add_development_dependency "forgery"
  s.add_development_dependency "jquery-rails"
  s.add_development_dependency "newrelic_api"
  s.add_development_dependency "rails-observers"
  s.add_development_dependency "turbolinks"
  s.add_development_dependency "launchy"
  s.add_development_dependency "pry"
end