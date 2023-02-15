class CreateInspections < ActiveRecord::Migration[7.0]
  def change
    create_table :inspections do |t|
      t.references :user, null: false, foreign_key: true
      t.references :device, null: false, foreign_key: true
      t.datetime :inspection_date
      t.string :inspection_conclusion
      t.text :description

      t.timestamps
    end
  end
end
