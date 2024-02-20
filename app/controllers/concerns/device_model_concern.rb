module DeviceModelConcern
  extend ActiveSupport::Concern

  included do
    def device_model_create
      @device_model = DeviceModel.new(device_model_params)
      if @device_model.save
        redirect_back(fallback_location: root_path)
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    def device_model_params
      params.require(:device_model).permit(
        :name,
        :measurement_group_id,
        :measurement_class_id,
        :measuring_unit,
        :safety_class,
        :accuracy_class,
        :measurement_sensitivity,
        :measurement_min,
        :measurement_max,
        :manufacturer_id,
        :supplementary_kit_id,
        :is_complete_device,
        :is_tape_rolling_mechanism,
        :doc_url,
        :image_url,
        :calibration_min,
        :calibration_max,
        :gos_registry_id,
        :inspection_interval,
      )
    end
  end
end
