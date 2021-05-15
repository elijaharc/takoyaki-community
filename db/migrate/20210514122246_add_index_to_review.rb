# frozen_string_literal: true

class AddIndexToReview < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :seller_page, foreign_key: true
  end
end
