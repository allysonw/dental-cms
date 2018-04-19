class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :date
      t.string :time
      t.string :location
      t.integer :patient_id
      t.integer :user_id

      t.timestamps
    end
  end
end
