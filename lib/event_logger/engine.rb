module EventLogger
  class Engine < Rails::Engine

    initializer "event_logger.controller" do
      ActiveSupport.on_load(:action_controller) do
      	include EventLogger::Controller  
      end
    end

  end
end
