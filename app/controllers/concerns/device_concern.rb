module DeviceConcern
  extend ActiveSupport::Concern

  included do
    def device_show(device)
      unless device.supplementary_kit_id.nil?
        @device_components = DeviceComponent.where(supplementary_kit_id: @device.supplementary_kit_id)
      end
    end

    def device_create(path, params)
      device = Device.new(params)
      if device.save
        redirect_to(path)
      else
        render(:new)
      end
    end

    def device_update(device, params, path)
      if device.update(params)
        redirect_to(path)
      else
        render(:edit)
      end
    end
  end
end
