class Device < ApplicationRecord
  belongs_to :device_model
  belongs_to :device_reg_group

  has_many :inspections
  has_one :channel

  validates :inventory_id, :serial_id, :tabel_id, presence: true, uniqueness: true
end
