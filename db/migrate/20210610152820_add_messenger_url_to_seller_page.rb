class AddMessengerUrlToSellerPage < ActiveRecord::Migration[6.1]
  def change
    add_column :seller_pages, :messenger_url, :string
  end
end
