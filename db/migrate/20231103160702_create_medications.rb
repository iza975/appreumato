class CreateMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :dose
      t.time :frequency

      t.timestamps
    end
  end
end
