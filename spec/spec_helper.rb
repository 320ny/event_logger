# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rspec/rails"

# Run any available migration
ActiveRecord::Migrator.migrate File.expand_path("../dummy/db/migrate/", __FILE__)
