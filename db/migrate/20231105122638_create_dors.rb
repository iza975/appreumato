class CreateDors < ActiveRecord::Migration[7.0]
  def change
    create_table :dors do |t|
      t.string :location
      t.string :other_location
      t.string :intensity
      t.text :description

      t.timestamps
    end
  end
end
