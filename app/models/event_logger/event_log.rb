module EventLogger
  class EventLog < ActiveRecord::Base

    serialize :object

    # VALIDATIONS
    validates :event, :presence => true

  end
end
