# frozen_string_literal: true

class AddIndexToProduct < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :seller_page, foreign_key: true
  end
end
