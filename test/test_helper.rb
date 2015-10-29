# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../../test/dummy/config/environment.rb",  __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../../test/dummy/db/migrate", __FILE__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path('../../db/migrate', __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/pride"
require "pry-rails"

Minitest.backtrace_filter = Minitest::BacktraceFilter.new

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }


