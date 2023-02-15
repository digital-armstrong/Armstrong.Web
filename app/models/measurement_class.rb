class MeasurementClass < ApplicationRecord
  belongs_to :measurement_group

  has_many :device_models

  validates :name, presence: true
end
