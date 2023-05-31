module DeviceRegGroupConcern
  extend ActiveSupport::Concern

  included do
    def device_reg_group_create
      @device_reg_group = DeviceRegGroup.new(device_reg_group_params)
      if @device_reg_group.save
        redirect_back(fallback_location: root_path)
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    def device_reg_group_params
      params.require(:device_reg_group).permit(
        :name,
      )
    end
  end
end
