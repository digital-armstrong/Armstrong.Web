class DeviceRegGroupController < ApplicationController
  def index
    @device_reg_group = DeviceRegGroup.new
    @query = DeviceRegGroup.ransack(params[:q])
    @device_reg_groups = @query.result.
      order(:name).
      page(params[:page]).
      per(params[:per_page])
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

  def edit
    @device_reg_group = DeviceRegGroup.find(params[:id])
  end

  def update
    @device_reg_group = DeviceRegGroup.find(params[:id])
    if @device_reg_group.update(device_reg_group_params)
      redirect_to(device_reg_group_path)
    else
      render(:edit)
    end
  end

  def destroy
    @device_reg_group = DeviceRegGroup.find(params[:id])
    assigned_devices_count = Device.where(device_reg_group_id: params[:id]).count

    if assigned_devices_count > 0
      flash[:error] = "Ошибка! На эту регистрационную группу ссылаются приборы."
      redirect_to(device_reg_group_index_path)
    else
      @device_reg_group.destroy
      redirect_to(device_reg_group_index_path)
    end
  end

  private

  def device_reg_group_params
    params.require(:device_reg_group).permit(
      :name,
    )
  end
end
