class Admin::MeasurementClassController < ApplicationController
  include MeasurementClassConcern
  load_and_authorize_resource
  before_action :set_measurement_class, only: [:show, :edit, :update, :destroy]

  def index
    @query = MeasurementClass.ransack(params[:q])
    @pagy, @measurement_classes = pagy(@query.result.
      order(:name))
  end

  def new
    authorize!(:new, :measurement_class_admin)
    @measurement_class = MeasurementClass.new
  end

  def create
    authorize!(:create, :measurement_class_admin)
    measurement_class_create
  end

  def update
    if @measurement_class.update(measurement_class_params)
      redirect_back(fallback_location: root_path)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    assigned_device_models_count = DeviceModel.where(measurement_class_id: params[:id]).count

    if assigned_device_models_count.zero?
      @measurement_class.destroy
    else
      flash[:error] = t('message.measurement_class.delete.error')
    end
    redirect_to(admin_measurement_class_index_path)
  end

  private

  def set_measurement_class
    @measurement_class = MeasurementClass.find(params[:id])
  end

  def measurement_class_params
    params.require(:measurement_class).permit(
      :name,
      :measurement_group_id,
      :arms_device_type,
    )
  end
end
