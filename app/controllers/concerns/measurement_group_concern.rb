module MeasurementGroupConcern
  extend ActiveSupport::Concern

  included do
    def measurement_group_create
      @measurement_group = MeasurementGroup.new(measurement_group_params)
      if @measurement_group.save
        redirect_back(fallback_location: root_path)
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    def measurement_group_params
      params.require(:measurement_group).permit(
        :name,
      )
    end
  end
end
