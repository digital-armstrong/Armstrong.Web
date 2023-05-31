class DeviceComponentController < ApplicationController
  include DeviceComponentConcern
  load_and_authorize_resource

  def new
    @device_component = DeviceComponent.new
  end

  def create
    device_component_create
  end
end
