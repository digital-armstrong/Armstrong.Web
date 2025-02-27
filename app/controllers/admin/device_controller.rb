class Admin::DeviceController < ApplicationController
  include DeviceConcern
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  def index
    authorize!(:index, :device_admin)
    device_index
  end

  def new
    authorize!(:new, :device_admin)
    @device = Device.new
  end

  def create
    authorize!(:create, :device_admin)
    device_create
  end

  def show
    authorize!(:show, :device_admin)
    @inspection = Inspection.new
    device_show(@device)
    @is_admin = true
  end

  def edit
    authorize!(:edit, :device_admin)
  end

  def update
    authorize!(:update, :device_admin)
    device_update(@device)
  end

  def destroy
    authorize!(:destroy, :device_admin)
    device_destroy(@device, admin_device_index_path, admin_device_path(@device))
  end

  def create_inspection
    create_inspection_for_device(Device.find_by_id(params[:device_id]))
  end

  private

  def set_device
    @device = Device.find(params[:id])
  end
end
