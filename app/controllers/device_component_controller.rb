class DeviceComponentController < ApplicationController
  def index
    @query = DeviceComponent.ransack(params[:q])
    @device_components = @query.result.
      includes(:supplementary_kit).
      order(:serial_id).
      page(params[:page]).
      per(params[:per_page])
  end

  def show
    @device_component = DeviceComponent.find(params[:id])
  end

  def new
    @device_component = DeviceComponent.new
  end

  def create
    @device_component = DeviceComponent.new(device_component_params)
    if @device_component.save
      redirect_to(device_component_index_path)
    else
      render(:new)
    end
  end

  def edit
    @device_component = DeviceComponent.find(params[:id])
  end

  def update
    @device_component = DeviceComponent.find(params[:id])
    if @device_component.update(device_component_params)
      redirect_to(device_component_path)
    else
      render(:edit)
    end
  end

  def destroy
    @device_component = DeviceComponent.find(params[:id])
    @device_component.destroy
    redirect_to(device_component_index_path)
  end

  private

  def device_component_params
    params.require(:device_component).permit(
      :serial_id,
      :name,
      :supplementary_kit_id,
      :measurement_max,
      :measurement_min,
      :measuring_unit,
      :description,
    )
  end
end
