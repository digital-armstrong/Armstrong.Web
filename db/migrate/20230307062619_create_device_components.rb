class CreateDeviceComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :device_components do |t|
      t.integer :serial_id
      t.string :name
      t.references :device_model, null: false, foreign_key: true
      t.float :measurement_max
      t.float :measurement_min
      t.string :measuring_unit
      t.string :description

      t.timestamps
    end
  end
end
