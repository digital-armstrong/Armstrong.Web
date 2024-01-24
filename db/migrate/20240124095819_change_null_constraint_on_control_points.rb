class ChangeNullConstraintOnControlPoints < ActiveRecord::Migration[7.0]
  def change
    change_column_null :control_points, :room_id, true
    change_column_null :control_points, :channel_id, true
    change_column_null :control_points, :device_id, true
  end
end
