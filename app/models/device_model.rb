class DeviceModel < ApplicationRecord
  belongs_to :measurement_group
  belongs_to :measurement_class
  belongs_to :manufacturer
  has_many :devices

  validates :name, presence: true, uniqueness: true
  validates :measurement_min, :measurement_max, :accuracy_class, :measurement_sensitivity, numericality: true, allow_nil: true
  validate :validate_measurement_group_belongs_to_measurement_class

  def validate_measurement_group_belongs_to_measurement_class
    if measurement_class.measurement_group != measurement_group
      errors.add(:measurement_class, "doesn't belongs to selected measurement group")
    end
  end

  def self.ransackable_attributes(_auth_object = nil)
    [
      'accuracy_class',
      'created_at',
      'doc_url',
      'id',
      'image_url',
      'is_complete_device',
      'is_tape_rolling_mechanism',
      'manufacturer_id',
      'measurement_class_id',
      'measurement_group_id',
      'measurement_max',
      'measurement_min',
      'measurement_sensitivity',
      'measuring_unit',
      'name',
      'safety_class',
      'updated_at',
      'gos_registry_id',
      'inspection_interval',
      'calibration_min',
      'calibration_min',
    ]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['measurement_group', 'measurement_class', 'manufacturer', 'devices']
  end
end
