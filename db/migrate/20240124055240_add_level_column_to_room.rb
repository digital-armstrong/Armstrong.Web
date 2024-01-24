class AddLevelColumnToRoom < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :level, :string
  end
end
