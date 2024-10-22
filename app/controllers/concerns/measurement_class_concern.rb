module MeasurementClassConcern
  extend ActiveSupport::Concern

  included do
    def measurement_class_create
      @measurement_class = MeasurementClass.new(measurement_class_params)
      if @measurement_class.save
        redirect_back(fallback_location: root_path)
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    def measurement_class_params
      params.require(:measurement_class).permit(
        :name,
        :measurement_group_id,
        :arms_device_type,
      )
    end
  end
end
