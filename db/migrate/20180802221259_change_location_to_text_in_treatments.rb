class ChangeLocationToTextInTreatments < ActiveRecord::Migration[5.2]
  def change
    change_column :treatments, :location, :string
  end
end
