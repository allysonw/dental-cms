class CreateTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :treatments do |t|
      t.string :name
      t.integer :location
      t.float :price
      t.references :treatment_plan, foreign_key: true

      t.timestamps
    end
  end
end
