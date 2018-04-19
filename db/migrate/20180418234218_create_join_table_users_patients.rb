class CreateJoinTableUsersPatients < ActiveRecord::Migration[5.2]
  def change
    create_table :users_patients do |t|
      t.integer :user_id
      t.integer :patient_id
      t.timestamps
    end
  end
end
