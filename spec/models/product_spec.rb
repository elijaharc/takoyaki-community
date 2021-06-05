require 'rails_helper'

RSpec.describe Product, type: :model do
  it { expect(described_class.new).to validate_presence_of :product_name }
  it { expect(described_class.new).to validate_presence_of :product_description }
  it { expect(described_class.new).to validate_presence_of :price }
  it { expect(described_class.new).to validate_presence_of :available }
end
