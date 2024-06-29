class RemoveUniqueIndexOnAccreditations < ActiveRecord::Migration[7.1]
  def change
    remove_index :accreditations, [:accreditable_id, :accreditable_type, :accreditation_type, :persona_id], unique: true
  end
end
