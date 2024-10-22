class Admin::DeviceRegGroupController < ApplicationController
  include DeviceRegGroupConcern
  load_and_authorize_resource
  before_action :set_device_reg_group, only: [:edit, :update, :destroy]

  def index
    @device_reg_group = DeviceRegGroup.new
    @query = DeviceRegGroup.ransack(params[:q])
    @pagy, @device_reg_groups = pagy(@query.result.
      order(:name))
  end

  def new
    authorize!(:new, :device_reg_group_admin)
    @device_reg_group = DeviceRegGroup.new
  end

  def create
    authorize!(:create, :device_reg_group_admin)
    device_reg_group_create
  end

  def update
    if @device_reg_group.update(device_reg_group_params)
      redirect_back(fallback_location: root_path)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    assigned_devices_count = Device.where(device_reg_group_id: params[:id]).count

    if assigned_devices_count.zero?
      @device_reg_group.destroy
    else
      flash[:error] = t('message.device_reg_group.delete.error')
    end
    redirect_to(admin_device_reg_group_index_path)
  end

  private

  def set_device_reg_group
    @device_reg_group = DeviceRegGroup.find(params[:id])
  end

  def device_reg_group_params
    params.require(:device_reg_group).permit(
      :name,
    )
  end
end
