class CreateMeasurementGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :measurement_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
