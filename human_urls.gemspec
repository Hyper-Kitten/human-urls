$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "human_urls/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "human_urls"
  s.version     = HumanUrls::VERSION
  s.authors     = ["Josh Klina"]
  s.email       = ["joshua.klina@gmail.com"]
  s.homepage    = "https://github.com/jklina/human-urls"
  s.summary     = "A simple way to add slugs to your Rails application"
  s.description = "Human URLs is an intentionally simple and straight forward way to add slugs to a Rails application."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.required_ruby_version = Gem::Requirement.new('>= 3.1.1')
  s.add_dependency "rails", ">= 7.0"
  s.add_dependency "tzinfo-data"

  s.add_development_dependency "pg"
  s.add_development_dependency "pry-rails"
end
