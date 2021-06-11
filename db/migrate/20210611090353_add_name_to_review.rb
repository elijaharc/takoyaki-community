class AddNameToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :reviewer_first_name, :string
    add_column :reviews, :reviewer_last_name, :string
  end
end
