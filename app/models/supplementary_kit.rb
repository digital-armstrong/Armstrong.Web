class SupplementaryKit < ApplicationRecord
  has_many :device_component
  has_one :device
end
