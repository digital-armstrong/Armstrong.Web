class DeviceRegGroup < ApplicationRecord
  has_many :devices

  validates :name, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    ['created_at', 'id', 'name', 'updated_at']
  end
end
