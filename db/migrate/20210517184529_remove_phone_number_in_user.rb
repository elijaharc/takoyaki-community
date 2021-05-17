class RemovePhoneNumberInUser < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :phone_number
  end

  def down
    add_column :users, :phone_number, :string
  end
end
