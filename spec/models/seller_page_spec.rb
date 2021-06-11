require 'rails_helper'

RSpec.describe SellerPage, type: :model do
  it { expect(described_class.new).to validate_presence_of :business_name }
  it { expect(described_class.new).to validate_uniqueness_of :business_name }
  it { expect(described_class.new).to validate_presence_of :business_info }
  it { expect(described_class.new).to validate_presence_of :phone_number }
  it { expect(described_class.new).to validate_uniqueness_of :phone_number }
  it { expect(described_class.new).to validate_presence_of :region }
  it { expect(described_class.new).to validate_presence_of :city }
  it { expect(described_class.new).to validate_presence_of :messenger_url }
end
