require 'date'

class Device < ApplicationRecord
  include ExportPdf

  current_year = Date.today.year
  year_error_msg = "должен быть больше 1900 и меньше или равен #{current_year}"

  belongs_to :device_model
  belongs_to :device_reg_group
  belongs_to :supplementary_kit, optional: true
  belongs_to :room, optional: true
  belongs_to :service

  has_many :inspections
  has_one :channel

  validates :inventory_id, numericality: { less_than_or_equal_to: 2147483647 }, uniqueness: true, allow_nil: true
  validates :serial_id, :tabel_id, presence: true, uniqueness: true
  validates :year_of_commissioning, :year_of_production, numericality: { in: 1900..current_year, message: year_error_msg }, allow_nil: true
  validates :year_of_production, presence: true

  def last_successful_inspection
    inspection = inspections.where(state: 'verification_successful').
      sort { |el| el.conclusion_date }.first
    return I18n.l(inspection.conclusion_date, format: :date) if inspection.present?
  end

  def self.ransackable_attributes(_auth_object = nil)
    ['created_at', 'device_model_id', 'device_reg_group_id', 'id', 'inventory_id', 'serial_id', 'tabel_id', 'updated_at',
     'year_of_commissioning', 'year_of_production', 'supplementary_kit_id', 'service_id']
  end

  def self.ransackable_associations(_auth_object = nil)
    ['channel', 'device_model', 'device_reg_group', 'inspections', 'supplementary_kit']
  end
end
