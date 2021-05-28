class AddRegionAndCityToSellerPage < ActiveRecord::Migration[6.1]
  def change
    add_column :seller_pages, :region, :string
    add_column :seller_pages, :city, :string
  end
end
