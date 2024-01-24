class ControlPoint < ApplicationRecord
  belongs_to :room, optional: true
  belongs_to :channel,optional: true
  belongs_to :device, optional: true

  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["channel_id", "created_at", "description", "device_id", "id", "name", "room_id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["channel", "device", "room"]
  end
end
