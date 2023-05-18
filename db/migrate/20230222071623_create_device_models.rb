class CreateDeviceModels < ActiveRecord::Migration[7.0]
  def change
    create_table :device_models do |t|
      t.string :name
      t.references :measurement_group, null: false, foreign_key: true
      t.references :measurement_class, null: false, foreign_key: true
      t.string :measuring_unit
      t.string :safety_class
      t.float :accuracy_class
      t.float :measurement_sensitivity
      t.float :measurement_min
      t.float :measurement_max
      t.references :manufacturer, null: false, foreign_key: true
      t.boolean :is_complete_device
      t.boolean :is_tape_rolling_mechanism
      t.string :doc_url
      t.string :image_url

      t.timestamps
    end
  end
end
