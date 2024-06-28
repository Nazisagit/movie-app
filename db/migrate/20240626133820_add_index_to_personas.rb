class AddIndexToPersonas < ActiveRecord::Migration[7.1]
  def change
    add_index :personas, :name, unique: true
  end
end
