class MeasurementClassController < ApplicationController
  def index
    @query = MeasurementClass.ransack(params[:q])
    @measurement_classes = @query.result.
      order(:name).
      page(params[:page]).
      per(params[:per_page])
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

  def edit
    @measurement_class = MeasurementClass.find(params[:id])
  end

  def update
    @measurement_class = MeasurementClass.find(params[:id])
    if @measurement_class.update(measurement_class_params)
      redirect_to(measurement_class_path)
    else
      render(:edit)
    end
  end

  def destroy
    @measurement_class = MeasurementClass.find(params[:id])
    @measurement_class.destroy
    redirect_to(measurement_class_index_path)
  end

  private

  def measurement_class_params
    params.require(:measurement_class).permit(
      :name,
      :measurement_group_id,
    )
  end
end
