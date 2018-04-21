class ChangeColumnsInAppointmentsToDateTime < ActiveRecord::Migration[5.2]
  def change
    change_column :appointments, :date, :datetime
    change_column :appointments, :time, :datetime
  end
end
