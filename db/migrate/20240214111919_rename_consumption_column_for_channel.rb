class RenameConsumptionColumnForChannel < ActiveRecord::Migration[7.0]
  def change
    rename_column :channels, :consumptiom, :consumption
  end
end
