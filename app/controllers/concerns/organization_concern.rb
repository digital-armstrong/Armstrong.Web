module OrganizationConcern
  extend ActiveSupport::Concern

  included do
    def organization_index
      @query = Organization.ransack(params[:q])
      @pagy, @organizations = pagy(@query.result.order(:name))
    end

    def organization_create
      @organization = Organization.new(organization_params)

      if @organization.save
        redirect_back(fallback_location: root_path)
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    def organization_update
      if @organization.update(organization_params)
        redirect_back(fallback_location: root_path)
      else
        render(:edit, status: :unprocessable_entity)
      end
    end

    def organization_destroy
      assigned_models_count =
        Division.where(organization_id: params[:id]).count +
        Service.where(organization_id: params[:id]).count +
        Building.where(organization_id: params[:id]).count

      if assigned_models_count.zero?
        @organization.destroy
      else
        flash[:error] = t('message.admin.organization.delete.error')
      end

      redirect_to(admin_organization_index_path)
    end

    private

    def set_organization
      @organization = Organization.find(params[:id])
    end

    def organization_params
      params.require(:organization).permit(
        :name,
        :full_address,
        :zip_code,
        :phone,
        :fax,
        :email,
      )
    end
  end
end
