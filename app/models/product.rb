# frozen_string_literal: true

class Product < ApplicationRecord
    belongs_to :seller_page
    validates :product_name, :product_description, :price, :seller_page_id, presence: true
    validates :available, inclusion: { in: [true, false] }
    validates :price, numericality: { only_float: true }
    validates :image, file_size: { less_than_or_equal_to: 25.megabytes }

  AVAILABILITY = [
    ["Available", true], ["Sold out", false],
  ].freeze

  paginates_per 3

  mount_uploader :image, ProductUploader
end
