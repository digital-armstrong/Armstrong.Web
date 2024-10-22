class RevertLastMigration < ActiveRecord::Migration[7.0]
  def change
    remove_reference :devices, :control_point, index: true, foreign_key: :true
    add_reference :control_points, :device, foreign_key: true
    add_column :devices, :inspection_interval, :float, default: 1.0, null: false
    add_column :control_points, :control_point_type, :string
  end
end
