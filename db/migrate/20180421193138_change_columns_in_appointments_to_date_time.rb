class ChangeColumnsInAppointmentsToDateTime < ActiveRecord::Migration[5.2]
  def change
    change_column :appointments, :date, "timestamp USING date::timestamp without time zone"
    change_column :appointments, :time, "timestamp USING date::timestamp without time zone"
  end
end
