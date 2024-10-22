# frozen_string_literal: true

module ExportPdf
  extend ActiveSupport::Concern

  module ClassMethods
    def to_pdf
      require('prawn')
      require('prawn/table')

      options = { position: :center, column_widths: [100, 100, 200, 100, 100], width: 600 }

      header = ['Таб. №', 'Сер. №', 'Модель', 'Год выпуска', 'Год ввода']
      data = all.map do |device|
        [device.tabel_id, device.serial_id, device.device_model.name, device.year_of_production, device.year_of_commissioning]
      end
      Prawn::Document.new do
        font_families.update('Roboto' => {
                               normal: Rails.root.join('app/assets/fonts/Roboto/Roboto-Regular.ttf'),
                               italic: Rails.root.join('app/assets/fonts/Roboto/Roboto-Italic.ttf'),
                               bold: Rails.root.join('app/assets/fonts/Roboto/Roboto-Bold.ttf'),
                               bold_italic: Rails.root.join('app/assets/fonts/Roboto/Roboto-BoldItalic.ttf'),
                             })
        font('Roboto')
        text('Экспорт устройств', align: :center, size: 18, style: :bold)
        table([header, *data], header: true, **options)
      end.render
    end
  end
end
