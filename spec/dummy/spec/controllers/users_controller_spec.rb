require 'spec_helper'

describe UsersController do
  describe "create" do
    it "will create a user_created_success event" do
      expect {
        post :create
      }.to change {EventLogger::EventLog.where(:event => 'user_created_success').count}.by(1)
    end
  end
end
