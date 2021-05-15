# frozen_string_literal: true

class SellerPage < ApplicationRecord
  belongs_to :user
  has_many :seller_products
end
