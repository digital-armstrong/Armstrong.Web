class CreateControlPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :control_points do |t|
      t.string :name
      t.string :description
      t.references :room, null: false, foreign_key: true
      t.references :channel, null: false, foreign_key: true
      t.references :device, null: false, foreign_key: true

      t.timestamps
    end
  end
end
