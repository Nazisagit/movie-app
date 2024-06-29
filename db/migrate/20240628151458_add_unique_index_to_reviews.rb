class AddUniqueIndexToReviews < ActiveRecord::Migration[7.1]
  def change
    add_index :reviews, [:user_id, :rating, :comment, :reviewable_id, :reviewable_type], unique: true
  end
end
