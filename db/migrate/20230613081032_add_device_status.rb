class AddDeviceStatus < ActiveRecord::Migration[7.0]
  def up
    add_column :devices, :inspection_expiration_status, :string, null: false, default: Device::INSPECTION_EXPIRATION_STATUS[:prepare_to_inspection]
    add_column :devices, :status, :string, null: false, default: Device::STATUS[:in_stock]
  end

  def down
    remove_column :device, :inspection_expiration_status
    remove_column :device, :status
  end
end
