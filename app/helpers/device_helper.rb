module DeviceHelper
  def set_inspection_status(device)
    separator = Date.today + 1.month
    current_date = Date.today

    unless device.last_successful_inspection_raw.nil?
      next_inspection_date = device.last_successful_inspection_raw + 1.year
      status = if next_inspection_date > separator
                 Device::INSPECTION_EXPIRATION_STATUS[:verified]
               elsif next_inspection_date <= separator && next_inspection_date > current_date
                 Device::INSPECTION_EXPIRATION_STATUS[:prepare_to_inspection]
               else
                 Device::INSPECTION_EXPIRATION_STATUS[:expired]
               end

      begin
        device.update(inspection_expiration_status: status)
      rescue ActiveRecord::ActiveRecordError => e
        puts(e.to_s)
      end
    end
  end
end
