class MeasurementGroupController < ApplicationController
  include MeasurementGroupConcern
  before_action :set_measurement_group, only: [:edit, :update, :destroy]
  load_and_authorize_resource

  def new
    @measurement_group = MeasurementGroup.new
  end

  def create
    measurement_group_create
  end
end
