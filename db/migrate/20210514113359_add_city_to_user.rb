# frozen_string_literal: true

class AddCityToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :city, :string
  end
end
