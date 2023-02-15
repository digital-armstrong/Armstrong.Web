class CreateDeviceRegGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :device_reg_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
