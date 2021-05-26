class AddAuthyToSellerPage < ActiveRecord::Migration[6.1]
  def change
    add_column :seller_pages, :authy_id, :string
  end
end
