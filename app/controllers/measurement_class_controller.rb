class MeasurementClassController < ApplicationController
  include MeasurementClassConcern
  load_and_authorize_resource

  def new
    @measurement_class = MeasurementClass.new
  end

  def create
    measurement_class_create
  end
end
