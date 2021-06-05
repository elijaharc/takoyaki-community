require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
    describe "OmniAuth" do
        before do
            request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
        end
        
        it "sets uid" do
            request.env["omniauth.auth"][:uid].should == '123545'
        end
    end

  it { expect(described_class.new).to validate_presence_of :first_name }
  it { expect(described_class.new).to validate_presence_of :last_name }
end
