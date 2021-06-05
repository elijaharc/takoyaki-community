require 'rails_helper'

RSpec.describe User, type: :model do
  return_user = described_class.from_omniauth(OmniAuth.config.mock_auth[:facebook])

  describe "OmniAuth" do
    it "creates User" do
      expect(return_user).to be_instance_of User
    end
    
    it "sets UID" do
        expect(return_user.uid).to eq "12345"
    end
  end

  it { expect(described_class.new).to validate_presence_of :first_name }
  it { expect(described_class.new).to validate_presence_of :last_name }
end
