class DeviceModelController < ApplicationController
  def index
    @query = DeviceModel.ransack(params[:q])
    @device_models = @query.result.
      includes(:measurement_class, :measurement_group, :manufacturer, :supplementary_kit).
      order(:name).
      page(params[:page]).
      per(params[:per_page])
  end

  def show
    @device_model = DeviceModel.find(params[:id])
    supplementary_kit = @device_model.supplementary_kit_id
    unless supplementary_kit.nil?
      @device_models_in_supp_kit = DeviceModel.
        where(supplementary_kit_id: supplementary_kit).
        excluding(@device_model)
    end
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

  def edit
    @device_model = DeviceModel.find(params[:id])
  end

  def update
    @device_model = DeviceModel.find(params[:id])
    if @device_model.update(device_model_params)
      redirect_to(device_model_path)
    else
      render(:edit)
    end
  end

  def destroy
    @device_model = DeviceModel.find(params[:id])
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
