class MeasurementClassController < ApplicationController
  before_action :set_measurement_class, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @query = MeasurementClass.ransack(params[:q])
    @pagy, @measurement_classes = pagy(@query.result.
      order(:name))
  end

  def new
    @measurement_class = MeasurementClass.new
  end

  def create
    @measurement_class = MeasurementClass.new(measurement_class_params)
    if @measurement_class.save
      redirect_to(measurement_class_index_path)
    else
      render(:new)
    end
  end

  def update
    if @measurement_class.update(measurement_class_params)
      redirect_to(measurement_class_path)
    else
      render(:edit)
    end
  end

  def destroy
    assigned_device_models_count = DeviceModel.where(measurement_class_id: params[:id]).count

    if assigned_device_models_count.zero?
      @measurement_class.destroy
    else
      flash[:error] = 'Ошибка! На класс измерения ссылаются модели приборов!'
    end
    redirect_to(measurement_class_index_path)
  end

  private

  def set_measurement_class
    @measurement_class = MeasurementClass.find(params[:id])
  end

  def measurement_class_params
    params.require(:measurement_class).permit(
      :name,
      :measurement_group_id,
    )
  end
end
