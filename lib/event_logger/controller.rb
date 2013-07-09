module EventLogger
  # Gets included into the app's controllers automatically by the railtie
  module Controller
    
    extend ActiveSupport::Concern

    protected 

    # <tt>log_event</tt> is used to log any arbiraty event.
    # It should be called directly in a controller action.
    # The method takes two options:
    # 1. event [string] - required
    # 2. object [object] - optional
    #
    # Example:
    #   
    #   class UsersController < ApplicationController
    #     
    #     def create
    #       user = User.create(name: 'Bob Vance')
    #       log_event('user_created', user)
    #     end
    #
    #   end
    #
    def log_event(event, object=nil)
      log = EventLog.new(event: event, object: object)
      log.save
    end

  end
end
    
