class AddDeviceModelCalibrationFields < ActiveRecord::Migration[7.0]
  def change
    add_column :device_models, :calibration_min, :float
    add_column :device_models, :calibration_max, :float
  end
end
