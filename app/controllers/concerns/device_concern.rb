module DeviceConcern
  extend ActiveSupport::Concern

  included do
    def device_show(device)
      unless device.supplementary_kit_id.nil?
        @device_components = DeviceComponent.where(supplementary_kit_id: @device.supplementary_kit_id)
      end
    end

    def device_create(params)
      @device = Device.new(params)
      if @device.save
        redirect_back(fallback_location: root_path)
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    def device_update(device, params)
      if device.update(params)
        redirect_back(fallback_location: root_path)
      else
        render(:edit, status: :unprocessable_entity)
      end
    end

    def create_inspection_for_device(device)
      inspection = device.inspections.build(creator_id: current_user.id, type_target: inspection_params[:type_target])
      if inspection.save
        flash[:success] = 'Success'
        redirect_to(device_path(device))
      else
        flash[:error] = 'Error...'
        render(:show)
      end
    end

    def inspection_params
      params.require(:inspection).permit(:type_target)
    end
  end
end
