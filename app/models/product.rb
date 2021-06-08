# frozen_string_literal: true

class Product < ApplicationRecord
    belongs_to :seller_page
    validates :product_name, :product_description, :price, :available, :seller_page_id, presence: true
    validates :available, inclusion: { in: [true, false] }
    validates :image, file_size: { less_than_or_equal_to: 25.megabytes }

    AVAILABILITY = [
        ['Available', true], ['Sold out', false]
    ].freeze

    mount_uploader :image, ProductUploader
end
