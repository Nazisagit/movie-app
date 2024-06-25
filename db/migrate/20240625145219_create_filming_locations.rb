class CreateFilmingLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :filming_locations do |t|
      t.references :filmable, polymorphic: true, null: false
      t.string :name, null: false
      t.string :country, null: false

      t.timestamps
    end
  end
end
