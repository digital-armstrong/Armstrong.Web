class AddColumntToControlPoint < ActiveRecord::Migration[7.0]
  def change
    add_reference :control_points, :service, foreign_key: true
  end
end
