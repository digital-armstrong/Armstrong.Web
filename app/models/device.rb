class Device < ApplicationRecord
  include ExportPdf

  belongs_to :device_model
  belongs_to :device_reg_group

  has_many :inspections
  has_one :channel

  validates :inventory_id, numericality: { less_than_or_equal_to: 2147483647 }, presence: true, uniqueness: true
  validates :serial_id, :tabel_id, presence: true, uniqueness: true
  validates :year_of_commissioning, :year_of_production,
            numericality: { in: 1900..3000, message: 'должен быть больше или равен 1900 и меньше 3001' }, allow_nil: true
  validates :year_of_production, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    ['created_at', 'device_model_id', 'device_reg_group_id', 'id', 'inventory_id', 'serial_id', 'tabel_id', 'updated_at',
     'year_of_commissioning', 'year_of_production']
  end

  def self.ransackable_associations(_auth_object = nil)
    ['channel', 'device_model', 'device_reg_group', 'inspections']
  end
end
