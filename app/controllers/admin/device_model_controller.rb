class Admin::DeviceModelController < ApplicationController
  before_action :set_device_model, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @query = DeviceModel.ransack(params[:q])
    @pagy, @device_models = pagy(@query.result.
      includes(:measurement_class, :measurement_group, :manufacturer).
      order(:name))
  end

  def new
    @device_model = DeviceModel.new
  end

  def create
    @device_model = DeviceModel.new(device_model_params)
    if @device_model.save
      redirect_to(device_model_index_path)
    else
      render(:new)
    end
  end

  def update
    if @device_model.update(device_model_params)
      redirect_to(device_model_path)
    else
      render(:edit)
    end
  end

  def destroy
    assigned_devices_count = Device.where(device_model_id: params[:id]).count

    if assigned_devices_count.zero?
      @device_model.destroy
      redirect_to(device_model_index_path)
    else
      flash[:error] = 'Ошибка! На модель прибора ссылаются приборы!'
      redirect_to(device_model_path(@device_model))
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
