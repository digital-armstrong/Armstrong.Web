module DeviceConcern
  extend ActiveSupport::Concern

  included do
    def device_show(device)
      unless device.supplementary_kit_id.nil?
        @device_components = DeviceComponent.where(supplementary_kit_id: @device.supplementary_kit_id)
      end
    end

    def device_create
      @device = Device.new(device_params)
      if @device.save
        redirect_back(fallback_location: root_path)
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    def device_update(device)
      if device.update(device_params)
        redirect_back(fallback_location: root_path)
      else
        render(:edit, status: :unprocessable_entity)
      end
    end

    def device_destroy(device, path_success, path_failure)
      assigned_inspections_count = Inspection.where(device_id: device.id).count
      assigned_channels_count = Channel.where(device_id: device.id).count

      if assigned_inspections_count.zero? && assigned_channels_count.zero?
        device.destroy
        redirect_to(path_success)
      else
        flash[:error] = 'Ошибка! На этот прибор ссылаются инспекции или каналы!'
        redirect_to(path_failure)
      end
    end

    def create_inspection_for_device(device)
      inspection = device.inspections.build(creator_id: current_user.id, type_target: inspection_params[:type_target])
      if inspection.save
        flash[:success] = 'Success'
        redirect_to(device_path(device))
      else
        flash.now[:error] = 'Error...'
        render(:show)
      end
    end

    def inspection_params
      params.require(:inspection).permit(:type_target)
    end

    def device_params
      params.require(:device).permit(:inventory_id,
                                     :tabel_id,
                                     :serial_id,
                                     :device_model_id,
                                     :device_reg_group_id,
                                     :year_of_production,
                                     :year_of_commissioning,
                                     :supplementary_kit_id,
                                     :room_id,
                                     :service_id)
    end
  end
end
