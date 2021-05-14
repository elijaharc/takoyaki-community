class AddIndexToSellerPage < ActiveRecord::Migration[6.1]
  def change
    add_reference :seller_pages, :user, foreign_key: true
  end
end
