# db/migrate/xxxxxx_create_pain_records.rb

class CreatePainRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :pain_records do |t|
      t.string :location
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
