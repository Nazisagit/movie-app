class CreateFilmableFilmingLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :filmable_filming_locations do |t|
      t.references :filmable, polymorphic: true, null: false
      t.references :filming_location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
