class Admin::ControlPointController < ApplicationController
  include ControlPointConcern
  load_and_authorize_resource
  before_action :set_control_point, only: [:show, :edit, :update, :destroy]

  def index
    @query = ControlPoint.ransack(params[:q])
    @pagy, @control_points = pagy(@query.result.
      order(:name))
  end

  def new
    authorize!(:new, :control_point_admin)
    @control_point = ControlPoint.new
  end

  def create
    authorize!(:create, :control_point_admin)
    control_point_create
  end

  def update
    if @control_point.update(control_point_params)
      redirect_back(fallback_location: root_path)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    assigned_models_count =
      Room.where(control_point_id: params[:id]).count +
      Device.where(control_point_id: params[:id]).count +
      Channel.where(control_point_id: params[:id]).count

    if assigned_models_count.zero?
      @control_point.destroy
    else
      flash[:error] = t('message.control_point.delete.error')
    end
    redirect_to(admin_control_point_index_path)
  end

  private

  def set_control_point
    @control_point = ControlPoint.find(params[:id])
  end

  def control_point_params
    params.require(:control_point).permit(
      :name,
      :room_id,
      :device_id,
      :channel_id,
    )
  end
end
