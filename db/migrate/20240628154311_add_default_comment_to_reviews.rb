class AddDefaultCommentToReviews < ActiveRecord::Migration[7.1]
  def change
    change_column :reviews, :comment, :string, default: ""
  end
end
