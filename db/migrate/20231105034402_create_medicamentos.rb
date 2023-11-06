class CreateMedicamentos < ActiveRecord::Migration[7.0]
  def change
    create_table :medicamentos do |t|
      t.string :name
      t.string :dose
      t.string :frequency
      t.boolean :taken

      t.timestamps
    end
  end
end
