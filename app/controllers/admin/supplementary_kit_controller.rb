class Admin::SupplementaryKitController < ApplicationController
  include SupplementaryKitConcern
  load_and_authorize_resource
  before_action :set_supplementary_kit, only: [:edit, :update, :destroy]

  def index
    @query = SupplementaryKit.ransack(params[:q])
    @pagy, @supplementary_kits = pagy(@query.result.
      order(:name))
    @device_components = DeviceComponent.all
  end

  def new
    authorize!(:new, :supplementary_kit_admin)
    @supplementary_kit = SupplementaryKit.new
  end

  def create
    authorize!(:create, :supplementary_kit_admin)
    supplementary_kit_create
  end

  def update
    if @supplementary_kit.update(supplementary_kit_params)
      redirect_back(fallback_location: root_path)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    assigned_devices_count = Device.where(supplementary_kit_id: params[:id]).count
    assigned_device_components_count = DeviceComponent.where(supplementary_kit_id: params[:id]).count

    if assigned_devices_count.zero? && assigned_device_components_count.zero?
      @supplementary_kit.destroy
    else
      flash[:error] = t('message.supplementary_kit.delete.error')
    end
    redirect_to(admin_supplementary_kit_index_path)
  end

  private

  def set_supplementary_kit
    @supplementary_kit = SupplementaryKit.find(params[:id])
  end

  def supplementary_kit_params
    params.require(:supplementary_kit).permit(
      :name,
      :serial_id,
      :description,
    )
  end
end
