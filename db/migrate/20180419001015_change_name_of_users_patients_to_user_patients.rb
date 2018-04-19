class ChangeNameOfUsersPatientsToUserPatients < ActiveRecord::Migration[5.2]
  def change
    rename_table :users_patients, :user_patients
  end
end
