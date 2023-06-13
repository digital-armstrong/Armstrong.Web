class CheckDeviceStatusJob
  include Sidekiq::Worker

  def perform
    Device.find_each do |device|
      next_verification_date = device.last_successful_inspection + 1.year
      status = if next_verification_date > Date.today
                 Device::INSPECTION_EXPIRATION_STATUS[:verified]
               elsif next_verification_date <= Date.today && next_verification_date > Date.today - 1.month
                 Device::INSPECTION_EXPIRATION_STATUS[:prepare_to_inspection]
               else
                 Device::INSPECTION_EXPIRATION_STATUS[:expired]
               end

      device.update(inspection_expiration_status: status)
    end
  end
end
