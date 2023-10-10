class CreateMedicationRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :medication_records do |t|
      t.references :user, null: false, foreign_key: true
      t.string :medication_name
      t.string :medication_dose
      t.string :medication_frequency

      t.timestamps
    end
  end
end
