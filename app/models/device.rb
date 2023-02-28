class Device < ApplicationRecord
  belongs_to :device_model
  belongs_to :device_reg_group

  has_many :inspections
  has_one :channel

  validates :inventory_id, :serial_id, :tabel_id, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "device_model_id", "device_reg_group_id", "id", "inventory_id", "serial_id", "tabel_id", "updated_at", "year_of_commissioning", "year_of_production"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["channel", "device_model", "device_reg_group", "inspections"]
  end
end
