# frozen_string_literal: true

class Product < ApplicationRecord
    belongs_to :seller_page
    validates :product_name, :product_description, :price, presence: true
    AVAILABILITY = [
        ['Available', true], ['Sold out', false]
    ].freeze
    validates :image, file_size: { less_than_or_equal_to: 25.megabytes }

    mount_uploader :image, ProductUploader
end
