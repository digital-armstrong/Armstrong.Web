class DeviceModel < ApplicationRecord
  belongs_to :measurement_group
  belongs_to :measurement_class
  belongs_to :manufacturer
  belongs_to :supplementary_kit

  has_many :devices

  validates :name, presence: true
end
