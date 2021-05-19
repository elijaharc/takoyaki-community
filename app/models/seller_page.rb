# frozen_string_literal: true

class SellerPage < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy
  validates :business_name, :business_info, presence: true
end
