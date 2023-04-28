class AddDeviceLocationColumn < ActiveRecord::Migration[7.0]
  def change
    add_reference :devices, :room, index: true, foreign_key: true
  end
end
