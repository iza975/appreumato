class AddUserIdToMedications < ActiveRecord::Migration[6.0]
  def change
    add_reference :medications, :user, foreign_key: true
  end
end
