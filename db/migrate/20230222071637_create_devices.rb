class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.integer :inventory_id
      t.string :serial_id
      t.integer :tabel_id
      t.references :device_model, null: false, foreign_key: true
      t.references :device_reg_group, null: false, foreign_key: true
      t.integer :year_of_production
      t.integer :year_of_commissioning
      t.references :supplementary_kit, null: true, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.timestamps
    end
    add_index :devices, :inventory_id, unique: true
    add_index :devices, :tabel_id, unique: true
  end
end
