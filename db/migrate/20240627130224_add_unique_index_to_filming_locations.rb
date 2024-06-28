class AddUniqueIndexToFilmingLocations < ActiveRecord::Migration[7.1]
  def change
    add_index :filming_locations, [:name, :country], unique: true
  end
end
