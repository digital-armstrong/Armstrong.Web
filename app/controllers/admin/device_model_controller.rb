class Admin::DeviceModelController < ApplicationController
  include DeviceModelConcern
  load_and_authorize_resource
  before_action :set_device_model, only: [:show, :edit, :update, :destroy]

  def index
    @query = DeviceModel.ransack(params[:q])
    @pagy, @device_models = pagy(@query.result.
      includes(:measurement_class, :measurement_group, :manufacturer).
      order(:name))
  end

  def new
    authorize!(:new, :device_model_admin)
    @device_model = DeviceModel.new
  end

  def create
    authorize!(:create, :device_model_admin)
    device_model_create
  end

  def update
    if @device_model.update(device_model_params)
      redirect_back(fallback_location: root_path)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    assigned_devices_count = Device.where(device_model_id: params[:id]).count

    if assigned_devices_count.zero?
      @device_model.destroy
      redirect_to(admin_device_model_index_path)
    else
      flash[:error] = t('message.device_model.delete.error')
      redirect_to(admin_device_model_path(@device_model))
    end
  end

  private

  def set_device_model
    @device_model = DeviceModel.find(params[:id])
  end

  def device_model_params
    params.require(:device_model).permit(
      :name,
      :measurement_group_id,
      :measurement_class_id,
      :measuring_unit,
      :safety_class,
      :accuracy_class,
      :measurement_sensitivity,
      :measurement_min,
      :measurement_max,
      :manufacturer_id,
      :supplementary_kit_id,
      :is_complete_device,
      :is_tape_rolling_mechanism,
      :doc_url,
      :image_url,
    )
  end
end
