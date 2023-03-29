class CreateInspections < ActiveRecord::Migration[7.0]
  def change
    create_table :inspections do |t|
      t.references :device, null: false, foreign_key: true
      t.string :state, default: "sent", null: false
      t.datetime :conclusion_date
      t.string :conclusion
      t.text :description
      t.references :creator, null: false
      t.references :performer

      t.timestamps
    end
    add_foreign_key "inspections", "users", column: "creator_id"
    add_foreign_key "inspections", "users", column: "performer_id"
  end
end
