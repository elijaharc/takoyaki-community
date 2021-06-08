class AddSlugToSellerPage < ActiveRecord::Migration[6.1]
  def change
    add_column :seller_pages, :slug, :string
    add_index :seller_pages, :slug, unique: true
  end
end
