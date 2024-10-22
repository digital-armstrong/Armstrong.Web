module ServiceConcern
  extend ActiveSupport::Concern

  included do
    def service_create
      @service = Service.new(service_params)

      if @service.save
        redirect_back(fallback_location: root_path)
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    def service_params
      params.require(:service).permit(
        :name,
        :division_id,
        :organization_id,
        :building_id,
      )
    end
  end
end
