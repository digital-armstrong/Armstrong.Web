class ChangeDevicesSerialIdType < ActiveRecord::Migration[7.0]
  def up
    change_column :devices, :serial_id, :string
  end

  def down
    change_column :devices, :serial_id, :integer
  end
end
