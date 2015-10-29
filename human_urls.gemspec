$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "human_urls/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "human_urls"
  s.version     = HumanUrls::VERSION
  s.authors     = ["Josh Klina"]
  s.email       = ["joshua.klina@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of HumanUrls."
  s.description = "TODO: Description of HumanUrls."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.required_ruby_version = Gem::Requirement.new('>= 2.0.0')
  s.add_dependency "rails", ">= 4.1"

  s.add_development_dependency "pg"
  s.add_development_dependency "minitest-rails"
  s.add_development_dependency "pry-rails"
end
