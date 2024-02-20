class ChangeInspectionIntervalType < ActiveRecord::Migration[7.0]
  def change
    change_column :device_models, :inspection_interval, :int, default: 1
  end
end
