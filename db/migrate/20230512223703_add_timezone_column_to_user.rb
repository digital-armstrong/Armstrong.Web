class AddTimezoneColumnToUser < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :timezone, :string, null: false, default: "UTC"
  end

  def down
    remove_column :users, :timezone
  end
end
