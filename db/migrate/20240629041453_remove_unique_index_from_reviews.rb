class RemoveUniqueIndexFromReviews < ActiveRecord::Migration[7.1]
  def change
    remove_index :reviews, [:user_id, :rating, :comment, :reviewable_id, :reviewable_type], unique: true
    add_index :reviews, [:reviewable_id, :user_id], unique: true
  end
end
