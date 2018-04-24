class CreateTreatmentPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :treatment_plans do |t|
      t.string :name
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
