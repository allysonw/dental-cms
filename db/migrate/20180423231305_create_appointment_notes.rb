class CreateAppointmentNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :appointment_notes do |t|
      t.string :content
      t.references :appointment, foreign_key: true

      t.timestamps
    end
  end
end
