class MeasurementClass < ApplicationRecord
  belongs_to :measurement_group

  has_many :device_models

  validates :name, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    ['arms_device_type', 'created_at', 'id', 'measurement_group_id', 'name', 'updated_at']
  end
end
