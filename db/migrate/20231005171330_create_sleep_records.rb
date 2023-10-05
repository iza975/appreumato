class CreateSleepRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :sleep_records do |t|
      t.float :sleep_duration
      t.string :restful_sleep
      t.string :woke_up
      t.string :dreams_nightmares
      t.text :sleep_description

      t.timestamps
    end
  end
end
