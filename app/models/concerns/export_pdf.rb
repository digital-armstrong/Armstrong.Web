# frozen_string_literal: true

module ExportPdf
  extend ActiveSupport::Concern

  module ClassMethods
    def to_pdf
      require 'prawn'
      require 'prawn/table'

      options = { position: :center, column_widths: [100, 100, 200, 100, 100], width: 600 }

      header = ["Tab", "S/N", "Model", "Prod", "Com"]
      data = all.map { |device| [device.tabel_id, device.serial_id, device.device_model.name, device.year_of_production, device.year_of_commissioning] }
      Prawn::Document.new do
        text 'All Devices', align: :center, size: 18, style: :bold
        table([header, *data], header: true, **options)
      end.render
    end
  end
end
