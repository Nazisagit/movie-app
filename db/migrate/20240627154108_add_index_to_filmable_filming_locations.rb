class AddIndexToFilmableFilmingLocations < ActiveRecord::Migration[7.1]
  def change
    add_index :filmable_filming_locations, [:filmable_id, :filmable_type, :filming_location_id], unique: true
  end
end
