class ChangeDeviceModelSuppKitAllowNull < ActiveRecord::Migration[7.0]
  def up
    change_column :device_models, :supplementary_kit_id, :integer, :null => true
  end

  def down
    change_column :device_models, :supplementary_kit_id, :integer
  end
end
