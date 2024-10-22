class Channel < ApplicationRecord
  belongs_to :server
  belongs_to :service

  has_many :history
  belongs_to :control_point

  channel_id_msg = 'должен быть в диапозоне от 1 до 48'

  validates :channel_id, presence: true, numericality: { in: 1..48, message: channel_id_msg }

  def self.ransackable_associations(_auth_object = nil)
    ['control_point', 'history', 'server', 'service']
  end

  def self.ransackable_attributes(_auth_object = nil)
    [
      'channel_id', 'consumption', 'control_point_id',
      'conversion_coefficient', 'created_at',
      'emergency_limit', 'event_count', 'event_datetime',
      'event_error_count', 'event_impulse_value', 'event_not_system_value',
      'event_system_value', 'id', 'is_online',
      'is_special_control', 'location_description', 'pre_emergency_limit',
      'self_background', 'server_id', 'service_id',
      'state', 'updated_at'
    ]
  end
end
