class MeasurementGroup < ApplicationRecord
  has_many :device_models
  has_many :measurement_classes

  validates :name, presence: true
end
