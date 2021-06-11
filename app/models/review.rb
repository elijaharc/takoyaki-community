# frozen_string_literal: true

class Review < ApplicationRecord
    belongs_to :seller_page
    validates :comment, :rating, presence: true
    RATING = [
        [1], [2], [3], [4], [5]
    ].freeze

    paginates_per 3
end
