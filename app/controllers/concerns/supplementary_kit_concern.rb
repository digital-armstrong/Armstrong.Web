module SupplementaryKitConcern
  extend ActiveSupport::Concern

  included do
    def supplementary_kit_create
      @supplementary_kit = SupplementaryKit.new(supplementary_kit_params)
      if @supplementary_kit.save
        redirect_back(fallback_location: root_path)
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    def supplementary_kit_params
      params.require(:supplementary_kit).permit(
        :name,
        :serial_id,
        :description,
      )
    end
  end
end
