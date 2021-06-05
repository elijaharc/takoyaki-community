require 'rails_helper'

RSpec.describe Review, type: :model do
  it { expect(described_class.new).to validate_presence_of :comment }
  it { expect(described_class.new).to validate_presence_of :rating }
end
