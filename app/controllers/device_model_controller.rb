class DeviceModelController < ApplicationController
  include DeviceModelConcern
  load_and_authorize_resource

  def new
    @device_model = DeviceModel.new
  end

  def create
    device_model_create
  end
end
