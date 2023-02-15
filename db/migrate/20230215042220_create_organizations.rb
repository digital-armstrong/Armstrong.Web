class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :full_address
      t.string :zip_code
      t.string :phone
      t.string :fax
      t.string :email

      t.timestamps
    end
  end
end
