# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :rating, default: 5
      t.timestamps
    end
  end
end
