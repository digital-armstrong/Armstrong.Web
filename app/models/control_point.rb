class ControlPoint < ApplicationRecord
  belongs_to :room, optional: true
  belongs_to :device, optional: true

  has_one :channel

  validates :name, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    ['channel_id', 'created_at', 'description', 'device_id', 'id', 'name', 'room_id', 'updated_at']
  end

  def self.ransackable_associations(_auth_object = nil)
    ['channel', 'device', 'room']
  end
end
