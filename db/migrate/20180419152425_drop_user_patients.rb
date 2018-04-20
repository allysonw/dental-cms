class DropUserPatients < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_patients
  end
end
