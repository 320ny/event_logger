module EventLogger
  # Gets included into the app's controllers automatically by the railtie
  module Controller
    
    extend ActiveSupport::Concern

    protected 

    def log_event(event, object=nil)
      log = EventLog.new(event: event, object: object)
      log.save
    end

  end
end
    
