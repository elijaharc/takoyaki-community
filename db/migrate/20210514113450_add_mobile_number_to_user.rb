# frozen_string_literal: true

class AddMobileNumberToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :phone_number, :string
  end
end
