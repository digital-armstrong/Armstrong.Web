module DeviceConcern
  extend ActiveSupport::Concern
  include DeviceHelper

  included do
    def device_index
      params[:q] ||= {}
      @query = Device.ransack(params[:q])
      condition = unless current_user.admin?
                    { service_id: current_user.service_id }
                  end
      if params[:q][:inspection_expiration_status_eq].present?
        @selected_status = params[:q][:inspection_expiration_status_eq].to_sym
      end
      @pagy, @devices = pagy(@query.result.
        includes(:device_model, :supplementary_kit).
        order(:tabel_id).
        where(condition))
    end

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
      assigned_channels_count = ControlPoint.where(device_id: device.id).count

      if assigned_inspections_count.zero? && assigned_channels_count.zero?
        device.destroy
        redirect_to(path_success)
      else
        flash[:error] = t('message.device.delete.error')
        redirect_to(path_failure)
      end
    end

    def create_inspection_for_device(device)
      inspection = if inspection_params[:is_admin]
                     device.inspections.build(creator_id: current_user.id,
                                              performer_id: current_user.id,
                                              type_target: inspection_params[:type_target],
                                              conclusion_date: inspection_params[:conclusion_date].to_datetime + 12.hours,
                                              conclusion: t('message.inspection.create_from_device.generated'),
                                              state: Inspection::STATES[:verification_successful])
                   else
                     device.inspections.build(creator_id: current_user.id, type_target: inspection_params[:type_target])
                   end
      if inspection.save
        set_inspection_status(device)
        flash[:success] = t('message.inspection.create_from_device.success')
        redirect_to(device_path(device))
      else
        flash.now[:error] = t('message.inspection.create_from_device.error')
        render(:show)
      end
    end

    def inspection_params
      params.require(:inspection).permit(:type_target, :conclusion_date, :is_admin)
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
