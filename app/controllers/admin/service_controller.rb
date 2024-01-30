class Admin::ServiceController < ApplicationController
  include ServiceConcern

  load_and_authorize_resource
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @query = Service.ransack(params[:q])
    @pagy, @services = pagy(@query.result.order(:name))
  end

  def new
    authorize!(:new, :service_admin)
    @service = Service.new
  end

  def create
    authorize!(:create, :service_admin)
    service_create
  end

  def update
    authorize!(:update, :service_admin)

    if @service.update(service_params)
      redirect_back(fallback_location: root_path)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    authorize!(:destroy, :service_admin)

    assigned_models_count =
      Device.where(service_id: params[:id]).count +
      User.where(service_id: params[:id]).count +
      Server.where(service_id: params[:id]).count +
      ControlPoint.where(service_id: params[:id]).count

    if assigned_models_count.zero?
      @service.destroy
    else
      flash[:error] = t('message.service.delete.error')
    end
    redirect_to(admin_service_index_path)
  end

  private

  def set_service
    @service = Service.find(params[:id])
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
