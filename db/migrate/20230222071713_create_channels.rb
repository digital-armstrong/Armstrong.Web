class CreateChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :channels do |t|
      t.string :name
      t.integer :channel_id
      t.references :device, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.references :server, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.text :location_description
      t.float :self_background, default: 0
      t.float :pre_emergency_limit, default: 1
      t.float :emergency_limit, default: 2
      t.float :consumptiom, default: 1
      t.float :conversion_coefficient, default: 0
      t.float :event_system_value, default: 0
      t.float :event_not_system_value, default: 0
      t.float :event_impulse_value, default: 0
      t.datetime :event_datetime
      t.integer :event_count, default: 0
      t.integer :event_error_count, default: 0
      t.boolean :is_special_control, default: false
      t.boolean :is_online
      t.string :state, default: 'normal'

      t.timestamps
    end
  end
end
