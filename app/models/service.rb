class Service < ApplicationRecord
  belongs_to :division
  belongs_to :organization
  belongs_to :building

  has_many :devices
  has_many :users
  has_many :servers
  has_many :control_points

  validates :name, :organization, :division, :building, presence: true
  validates :name, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["building_id", "created_at", "division_id", "id", "name", "organization_id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["building", "control_points", "devices", "division", "organization", "servers", "users"]
  end
end
