class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :dob
      t.string :address
      t.string :phone_number
      t.timestamps
    end
  end
end
