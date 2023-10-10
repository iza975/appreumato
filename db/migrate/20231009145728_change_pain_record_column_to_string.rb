class ChangePainRecordColumnToString < ActiveRecord::Migration[7.0]
  def change
    change_column :pain_records, :pain_intensity, :string
  end
end
