module ManufacturerConcern
  extend ActiveSupport::Concern

  included do
    def manufacturer_create
      @manufacturer = Manufacturer.new(manufacturer_params)
      if @manufacturer.save
        redirect_back(fallback_location: root_path)
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    def manufacturer_params
      params.require(:manufacturer).permit(
        :name,
        :adress,
        :phone,
        :email,
        :site_url,
      )
    end
  end
end
