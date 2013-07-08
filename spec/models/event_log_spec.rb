require 'spec_helper'

describe EventLog do
  it { should have_db_column(:event).of_type(:string) }
  it { should have_db_column(:object).of_type(:text) }
  it { should validate_presence_of(:event) }

  describe "#create" do
    it "should make a new event log given valid attributes" do
      expect { 
        event = EventLog.create(:event => "user:registration:failed", :object => "{'somekey': 'somevalue'}")
        event.save!
      }.to change {EventLog.count}.by(1)
    end
    it "will save a return full objects" do
      user = User.create(name: 'Frank Awesome', age: 30)
      event = EventLog.create(:event => "user_registration_success", :object => user)
      saved_event = EventLog.find(event.id)
      expect(saved_event.object.name).to eq(user.name)
    end
  end
     
end
