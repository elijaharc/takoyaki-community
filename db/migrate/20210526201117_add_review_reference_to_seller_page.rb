class AddReviewReferenceToSellerPage < ActiveRecord::Migration[6.1]
  def change
    add_reference :seller_pages, :review, foreign_key: true
  end
end
