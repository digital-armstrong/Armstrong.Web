class AddRegColumnToDeviceModel < ActiveRecord::Migration[7.0]
  def change
    add_column :device_models, :gos_registry_id, :string, null: true
    add_column :device_models, :inspection_interval, :float, default: 1.0, null: false

    remove_column :devices, :inspection_interval
  end
end
