class ChangePriceToDecimalInTreatments < ActiveRecord::Migration[5.2]
  def change
    change_column :treatments, :price, :decimal
  end
end
