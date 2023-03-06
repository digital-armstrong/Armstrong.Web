class DeviceModel < ApplicationRecord
  belongs_to :measurement_group
  belongs_to :measurement_class
  belongs_to :manufacturer
  belongs_to :supplementary_kit

  has_many :devices

  validates :name, presence: true

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
      'supplementary_kit_id',
      'updated_at',
    ]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['measurement_group', 'measurement_class', 'manufacturer', 'supplementary_kit', 'devices']
  end
end
