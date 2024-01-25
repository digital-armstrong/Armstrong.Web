class DeleteColumnFromChannel < ActiveRecord::Migration[7.0]
  def change
    remove_column :channels, :device_id
    remove_column :channels, :room_id
  end
end
