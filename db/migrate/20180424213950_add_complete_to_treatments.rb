class AddCompleteToTreatments < ActiveRecord::Migration[5.2]
  def change
    add_column :treatments, :complete, :boolean, default: false
  end
end
