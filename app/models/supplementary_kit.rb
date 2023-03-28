class SupplementaryKit < ApplicationRecord
  has_many :device_component
  has_one :device

  validates :name, :serial_id, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    ['created_at', 'description', 'id', 'name', 'serial_id', 'updated_at']
  end
end
