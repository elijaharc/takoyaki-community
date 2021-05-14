# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_description
      t.decimal :price
      t.boolean :available
      t.timestamps
    end
  end
end
