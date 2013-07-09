require 'spec_helper'

describe EventLogger::Controller do
    
  describe "#log_event" do
    before do
      @user = User.create(name: 'Bob Vance', age: '40')

      class FakeController < ActionController::Base

        def some_action
          log_event('user_created_success')
        end

        def action_to_store_object(id)
          user = User.find(id)
          log_event('user_signup', user)
        end
      end
      @controller = FakeController.new
    end

    it "will create an EventLogger::EventLog record" do
      expect {
        @controller.some_action
      }.to change {EventLogger::EventLog.count}.by(1)
    end
    it "will store full AR object" do
      @controller.action_to_store_object(@user.id)
      expect(EventLogger::EventLog.last.object).to eq(@user)
    end
    it "object defaults to nil" do
      @controller.some_action
      log = EventLogger::EventLog.last
      expect(log.event).to eq('user_created_success')
      expect(log.object).to eq(nil)
    end
  end

end
