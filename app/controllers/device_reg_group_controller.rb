class DeviceRegGroupController < ApplicationController
  before_action :set_device_reg_group, only: [:edit, :update, :destroy]

  def index
    @device_reg_group = DeviceRegGroup.new
    @query = DeviceRegGroup.ransack(params[:q])
    @pagy, @device_reg_groups = pagy @query.result.
      order(:name)
  end

  def new
    @device_reg_group = DeviceRegGroup.new
  end

  def create
    @device_reg_group = DeviceRegGroup.new(device_reg_group_params)
    if @device_reg_group.save
      redirect_to(device_reg_group_index_path)
    else
      @query = DeviceRegGroup.ransack(params[:q])
      @device_reg_groups = @query.result.
        order(:name).
        page(params[:page]).
        per(params[:per_page])
      render(:index)
    end
  end

  def update
    if @device_reg_group.update(device_reg_group_params)
      redirect_to(device_reg_group_path)
    else
      render(:edit)
    end
  end

  def destroy
    assigned_devices_count = Device.where(device_reg_group_id: params[:id]).count

    if assigned_devices_count.zero?
      @device_reg_group.destroy
    else
      flash[:error] = 'Ошибка! На эту регистрационную группу ссылаются приборы.'
    end
    redirect_to(device_reg_group_index_path)
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
