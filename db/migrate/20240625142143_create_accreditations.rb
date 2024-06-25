class CreateAccreditations < ActiveRecord::Migration[7.1]
  def change
    create_table :accreditations do |t|
      t.references :persona, null: false, foreign_key: true
      t.references :accreditable, polymorphic: true, null: false
      t.integer :accreditation_type, null: false, default: 0

      t.timestamps
    end
  end
end
