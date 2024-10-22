module DeviceComponentConcern
  extend ActiveSupport::Concern

  included do
    def device_component_create
      @device_component = DeviceComponent.new(device_component_params)
      if @device_component.save
        redirect_back(fallback_location: root_path)
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    def device_component_params
      params.require(:device_component).permit(
        :serial_id,
        :name,
        :supplementary_kit_id,
        :measurement_max,
        :measurement_min,
        :measuring_unit,
        :description,
      )
    end
  end
end
