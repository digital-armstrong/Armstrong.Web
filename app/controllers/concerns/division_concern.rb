module DivisionConcern
  extend ActiveSupport::Concern

  included do
    def division_index
      @query = Division.ransack(params[:q])
      @pagy, @divisions = pagy(@query.result.order(:name))
    end

    def division_create
      @division = Division.new(division_params)

      if @division.save
        redirect_back(fallback_location: root_path)
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    def division_update
      if @division.update(division_params)
        redirect_back(fallback_location: root_path)
      else
        render(:edit, status: :unprocessable_entity)
      end
    end

    def division_destroy
      assigned_models_count = Service.where(division_id: params[:id]).count

      if assigned_models_count.zero?
        @division.destroy
      else
        flash[:error] = t('message.admin.division.delete.error')
      end
      redirect_to(admin_division_index_path)
    end

    private

    def division_params
      params.require(:division).permit(
        :name,
        :organization_id,
      )
    end
  end
end
