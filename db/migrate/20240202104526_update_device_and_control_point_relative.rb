class UpdateDeviceAndControlPointRelative < ActiveRecord::Migration[7.0]
  def change
    remove_reference :control_points, :device, index: true, foreign_key: :true
    add_reference :devices, :control_point, foreign_key: true
  end
end
