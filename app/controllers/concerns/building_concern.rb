module BuildingConcern
  extend ActiveSupport::Concern

  included do # rubocop:disable Metrics/BlockLength
    def building_index
      @query = Building.ransack(params[:q])
      @pagy, @buildings = pagy(@query.result.order(:name))
    end

    def building_create
      @building = Building.new(building_params)

      if @building.save
        redirect_back(fallback_location: root_path)
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    def building_update
      if @building.update(building_params)
        redirect_back(fallback_location: root_path)
      else
        render(:edit, status: :unprocessable_entity)
      end
    end

    def building_destroy
      assigned_models_count =
        Room.where(building_id: params[:id]).count +
        Service.where(building_id: params[:id]).count

      if assigned_models_count.zero?
        @building.destroy
      else
        flash[:error] = t('message.admin.building.delete.error')
      end
      redirect_to(admin_building_index_path)
    end

    private

    def set_building
      @building = Building.find(params[:id])
    end

    def building_params
      params.require(:building).permit(
        :name,
        :organization_id,
        :description,
      )
    end
  end
end
