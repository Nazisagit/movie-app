class AddAvgRatingToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :avg_rating, :integer, null: false, default: 0
  end
end
