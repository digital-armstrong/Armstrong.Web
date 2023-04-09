class MeasurementGroupController < ApplicationController
  before_action :set_measurement_group, only: [:edit, :update, :destroy]

  def index
    @query = MeasurementGroup.ransack(params[:q])
    @pagy, @measurement_groupes = pagy @query.result.
      order(:name)
  end

  def new
    @measurement_group = MeasurementGroup.new
  end

  def create
    @measurement_group = MeasurementGroup.new(measurement_group_params)
    if @measurement_group.save
      redirect_to(measurement_group_index_path)
    else
      render(:new)
    end
  end

  def update
    if @measurement_group.update(measurement_group_params)
      redirect_to(measurement_group_path)
    else
      render(:edit)
    end
  end

  def destroy
    assigned_measurement_classes_count = MeasurementClass.where(measurement_group_id: params[:id]).count

    if assigned_measurement_classes_count.zero?
      @measurement_group.destroy
    else
      flash[:error] = 'Ошибка! На этот группу измерений ссылаются классы измерений!'
    end
    redirect_to(measurement_group_index_path)
  end

  private

  def set_measurement_group
    @measurement_group = MeasurementGroup.find(params[:id])
  end

  def measurement_group_params
    params.require(:measurement_group).permit(
      :name,
    )
  end
end
