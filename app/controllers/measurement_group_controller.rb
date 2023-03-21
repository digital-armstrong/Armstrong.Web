class MeasurementGroupController < ApplicationController
  def index
    @query = MeasurementGroup.ransack(params[:q])
    @measurement_groupes = @query.result.
      order(:name).
      page(params[:page]).
      per(params[:per_page])
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

  def edit
    @measurement_group = MeasurementGroup.find(params[:id])
  end

  def update
    @measurement_group = MeasurementGroup.find(params[:id])
    if @measurement_group.update(measurement_group_params)
      redirect_to(measurement_group_path)
    else
      render(:edit)
    end
  end

  def destroy
    @measurement_group = MeasurementGroup.find(params[:id])
    assigned_measurement_classes_count = MeasurementClass.where(measurement_group_id: params[:id]).count

    if assigned_measurement_classes_count.zero?
      @measurement_group.destroy
    else
      flash[:error] = 'Ошибка! На этот группу измерений ссылаются классы измерений!'
    end
    redirect_to(measurement_group_index_path)
  end

  private

  def measurement_group_params
    params.require(:measurement_group).permit(
      :name,
    )
  end
end
