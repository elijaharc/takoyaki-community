# frozen_string_literal: true

class SellerPage < ApplicationRecord
  
  belongs_to :user
  has_many :products, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :business_info, :region, :city, :phone_number, :messenger_url, presence: true
  validates :business_name, presence: true, uniqueness: true
  validates :phone_number, format: { with: /\A\d+\z/, message: "cannot have letters." }
  validates :phone_number, length: {minimum: 10, maximum: 10}
  validates :phone_number, uniqueness: true
  
  paginates_per 3

  # FriendlyID Gem
  extend FriendlyId
  friendly_id :business_name, use: :slugged
end
