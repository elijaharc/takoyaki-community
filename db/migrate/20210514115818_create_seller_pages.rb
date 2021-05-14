class CreateSellerPages < ActiveRecord::Migration[6.1]
  def change
    create_table :seller_pages do |t|
      t.string :business_name
      t.string :business_info
      t.boolean :verified, default: false
      t.timestamps
    end
  end
end
