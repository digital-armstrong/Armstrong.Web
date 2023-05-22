class CreateDeviceComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :device_components do |t|
      t.references :supplementary_kit, foreign_key: true
      t.string :serial_id
      t.string :name
      t.float :measurement_min
      t.float :measurement_max
      t.string :measuring_unit
      t.text :description

      t.timestamps
    end
  end
end
