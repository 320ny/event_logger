module EventLogger
  module Generators
    class EventLoggerGenerator < Rails::Generators::Base
      require 'rails/generators/active_record' 
      include Rails::Generators::Migration

      desc "Creates a migration file to generate the event_logs table"

      source_root File.expand_path('../templates', __FILE__)

      def create_migration_file
	migration_template 'create_event_logs_table.rb', 'db/migrate/create_event_logs_table.rb'
      end

      def self.next_migration_number(path)
        ActiveRecord::Generators::Base.next_migration_number(path)
      end

    end
  end
end
