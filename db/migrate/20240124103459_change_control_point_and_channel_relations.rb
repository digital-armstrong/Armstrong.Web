class ChangeControlPointAndChannelRelations < ActiveRecord::Migration[7.0]
  def change
    add_reference :channels, :control_point, null: true, foreign_key: true
  end
end
