class RemoveChannelColumnFromControlPoint < ActiveRecord::Migration[7.0]
  def change
    remove_column :control_points, :channel_id
  end
end
