# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_description
      t.float :price
      t.boolean :available, default: true
      t.timestamps
    end
  end
end
