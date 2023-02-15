class CreateSupplementaryKits < ActiveRecord::Migration[7.0]
  def change
    create_table :supplementary_kits do |t|
      t.string :name
      t.string :serial_id
      t.string :description

      t.timestamps
    end
  end
end
