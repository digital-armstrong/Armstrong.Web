class Admin::MeasurementGroupController < ApplicationController
  include MeasurementGroupConcern
  load_and_authorize_resource
  before_action :set_measurement_group, only: [:edit, :update, :destroy]

  def index
    @query = MeasurementGroup.ransack(params[:q])
    @pagy, @measurement_groupes = pagy(@query.result.
      order(:name))
  end

  def new
    authorize!(:new, :measurement_group_admin)
    @measurement_group = MeasurementGroup.new
  end

  def create
    authorize!(:create, :measurement_group_admin)
    measurement_group_create
  end

  def update
    if @measurement_group.update(measurement_group_params)
      redirect_back(fallback_location: root_path)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    assigned_measurement_classes_count = MeasurementClass.where(measurement_group_id: params[:id]).count

    if assigned_measurement_classes_count.zero?
      @measurement_group.destroy
    else
      flash[:error] = t('message.measurement_group.delete.error')
    end
    redirect_to(admin_measurement_group_index_path)
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
