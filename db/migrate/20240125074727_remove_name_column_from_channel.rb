class RemoveNameColumnFromChannel < ActiveRecord::Migration[7.0]
  def change
    remove_column :channels, :name
  end
end
