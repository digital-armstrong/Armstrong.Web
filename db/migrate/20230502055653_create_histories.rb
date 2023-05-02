class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.references :channel, null: false, foreign_key: true
      t.float :event_impulse_value
      t.float :event_system_value
      t.float :event_not_system_value
      t.datetime :event_datetime

      t.timestamps
    end
  end
end
