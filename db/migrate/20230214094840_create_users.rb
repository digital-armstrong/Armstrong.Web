class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :tabel_id
      t.string :first_name
      t.string :second_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :password_digest
      t.string :avatar_url
      t.string :type

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
