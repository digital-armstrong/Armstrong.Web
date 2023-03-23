class DeviceComponent < ApplicationRecord
  belongs_to :supplementary_kit

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "measurement_max", "measurement_min", "measuring_unit", "name", "serial_id", "supplementary_kit_id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["supplementary_kit"]
  end
end
