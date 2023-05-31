class DeviceRegGroupController < ApplicationController
  include DeviceRegGroupConcern
  load_and_authorize_resource

  def new
    @device_reg_group = DeviceRegGroup.new
  end

  def create
    device_reg_group_create
  end
end
