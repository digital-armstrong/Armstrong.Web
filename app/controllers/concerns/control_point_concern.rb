module ControlPointConcern
  extend ActiveSupport::Concern

  included do
    def control_point_create
      @control_point = ControlPoint.new(control_point_params)
      if @control_point.save
        redirect_back(fallback_location: root_path)
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    def control_point_params
      params.require(:control_point).permit(
        :name,
        :device_id,
        :room_id,
        :channel_id,
      )
    end
  end
end
