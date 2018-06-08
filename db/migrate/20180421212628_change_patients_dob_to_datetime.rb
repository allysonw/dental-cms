class ChangePatientsDobToDatetime < ActiveRecord::Migration[5.2]
  def change
    change_column :patients, :dob, "timestamp USING dob::timestamp without time zone"
  end
end
