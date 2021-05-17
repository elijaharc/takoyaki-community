class AddPhoneNumberToSellerPage < ActiveRecord::Migration[6.1]
  def change
    add_column :seller_pages, :phone_number, :string
  end
end
