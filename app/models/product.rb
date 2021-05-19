# frozen_string_literal: true

class Product < ApplicationRecord
    belongs_to :seller_page
    validates :product_name, :product_description, :price, presence: true
    AVAILABILITY = [
        ['Available', true], ['Sold out', false]
    ].freeze
end
