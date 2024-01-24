class ControlPointController < ApplicationController
  include ControlPointConcern

  load_and_authorize_resource

  def index
    @query = ControlPoint.ransack(params[:q])
    @query.sorts = ['name asc']
    @pagy, @control_points = pagy(@query.result)
  end

  def new
    @control_point = ControlPoint.new
  end

  def create
    control_point_create
  end
end
