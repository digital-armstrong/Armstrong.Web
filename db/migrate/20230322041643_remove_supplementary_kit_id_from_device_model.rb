class RemoveSupplementaryKitIdFromDeviceModel < ActiveRecord::Migration[7.0]
  def up
    remove_column :device_models, :supplementary_kit_id
  end

  def down
    add_column :device_models, :supplementary_kit_id, :integer
  end
end
