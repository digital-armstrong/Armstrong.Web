class DeviceComponentController < ApplicationController
  before_action :set_device_component, only: [:show, :edit, :update, :destroy]

  def index
    @query = DeviceComponent.ransack(params[:q])
    @pagy, @device_components = pagy @query.result.
      includes(:supplementary_kit).
      order(:serial_id)
  end

  def show
    @device_components = DeviceComponent.where(supplementary_kit_id: @device_component.supplementary_kit_id).
      excluding(@device_component)
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

  def update
    if @device_component.update(device_component_params)
      redirect_to(device_component_path)
    else
      render(:edit)
    end
  end

  def destroy
    @device_component.destroy
    redirect_to(device_component_index_path)
  end

  private

  def set_device_component
    @device_component = DeviceComponent.find(params[:id])
  end

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
