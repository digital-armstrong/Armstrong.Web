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

  STATUS = {
    verified: 'verified',
    expired: 'expired',
    on_repair: 'on_repair',
    mounted: 'mounted',
    in_stock: 'in_stock',
    sended_to_inspection: 'sended_to_inspection',
    removed: 'removed',
    in_storage: 'in_storage',
  }.freeze

  INSPECTION_EXPIRATION_STATUS = {
    verified: 'verified',
    prepare_to_inspection: 'prepare_to_inspection',
    expired: 'expired',
  }.freeze

  def last_successful_inspection
    inspection = inspections.where(state: 'verification_successful').
      order(:conclusion_date).last
    return formatted_date(inspection.conclusion_date, :date) unless inspection.nil?
  end

  def last_successful_inspection_raw
    inspection = inspections.where(state: 'verification_successful').
      order(:conclusion_date).last
    return inspection.conclusion_date unless inspection.nil?
  end

  def self.ransackable_attributes(_auth_object = nil)
    ['created_at', 'device_model_id', 'device_reg_group_id', 'id', 'inventory_id', 'serial_id', 'tabel_id', 'updated_at',
     'year_of_commissioning', 'year_of_production', 'supplementary_kit_id', 'service_id', 'inspection_expiration_status']
  end

  def self.ransackable_associations(_auth_object = nil)
    ['channel', 'device_model', 'device_reg_group', 'inspections', 'supplementary_kit']
  end
end
