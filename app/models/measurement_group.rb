class MeasurementGroup < ApplicationRecord
  has_many :device_models
  has_many :measurement_classes

  validates :name, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    ['created_at', 'id', 'name', 'updated_at']
  end
end
