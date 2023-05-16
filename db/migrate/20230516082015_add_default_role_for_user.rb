class AddDefaultRoleForUser < ActiveRecord::Migration[7.0]
  def up
    remove_column :users, :role
    add_column :users, :role, :string, null: false, default: "default"
  end

  def down
    remove_column :users, :role
    add_column :users, :role, :string, null: false
  end
end
