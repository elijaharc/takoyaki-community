class AddFromFacebookToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :from_facebook, :boolean, default: false
  end
end
