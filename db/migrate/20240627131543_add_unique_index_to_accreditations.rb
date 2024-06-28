class AddUniqueIndexToAccreditations < ActiveRecord::Migration[7.1]
  def change
    add_index :accreditations, [:accreditable_id, :accreditable_type, :accreditation_type, :persona_id], unique: true
  end
end
