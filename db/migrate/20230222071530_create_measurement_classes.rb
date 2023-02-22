class CreateMeasurementClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :measurement_classes do |t|
      t.string :name
      t.references :measurement_group, null: false, foreign_key: true
      t.integer :arms_device_type

      t.timestamps
    end
  end
end
