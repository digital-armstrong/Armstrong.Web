class CreateManufacturers < ActiveRecord::Migration[7.0]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :adress
      t.string :phone
      t.string :email
      t.string :site_url

      t.timestamps
    end
  end
end
