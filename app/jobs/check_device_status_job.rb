class CheckDeviceStatusJob
  include Sidekiq::Worker

  def perform
    Device.find_each do |device|
      seporator = Date.today + 1.month
      current_date = Date.today

      unless device.last_successful_inspection_raw.nil?
        next_inspection_date = device.last_successful_inspection_raw + 1.year
        status = if next_inspection_date > seporator
                  Device::INSPECTION_EXPIRATION_STATUS[:verified]
                elsif next_inspection_date <= seporator && next_inspection_date > current_date
                  Device::INSPECTION_EXPIRATION_STATUS[:prepare_to_inspection]
                else
                  Device::INSPECTION_EXPIRATION_STATUS[:expired]
                end

        device.update(inspection_expiration_status: status)
      end
    end
  end
end
