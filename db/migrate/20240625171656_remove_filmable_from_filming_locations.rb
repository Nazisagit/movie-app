class RemoveFilmableFromFilmingLocations < ActiveRecord::Migration[7.1]
  def change
    remove_column :filming_locations, :filmable_id, :integer
    remove_column :filming_locations, :filmable_type, :string
  end
end
