class ChangePatientsDobToDatetime < ActiveRecord::Migration[5.2]
  def change
    change_column :patients, :dob, :datetime
  end
end
