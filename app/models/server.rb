require 'resolv'

class Server < ApplicationRecord
  belongs_to :service
  belongs_to :room

  has_many :channels

  validates :name, :service, :room, presence: true
  validates :ip_address,
            presence: true,
            uniqueness: true,
            format: { with: Resolv::IPv4::Regex }

  def self.ransackable_attributes(_auth_object = nil)
    ['created_at', 'id', 'inventory_id', 'ip_address', 'name', 'room_id', 'service_id', 'updated_at']
  end

  def self.ransackable_associations(_auth_object = nil)
    ['channels', 'room', 'service']
  end
end
