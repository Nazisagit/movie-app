class AddIndexToMovies < ActiveRecord::Migration[7.1]
  def change
    add_index :movies, [:title, :year], unique: true
  end
end
