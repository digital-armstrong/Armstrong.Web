class Admin::DeviceController < ApplicationController
  include DeviceConcern
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  def index
    authorize!(:index, :device_admin)
    @query = Device.ransack(params[:q])
    @pagy, @devices = pagy(@query.result.
      includes(:device_model, :supplementary_kit).
      order(:tabel_id))
  end

  def new
    authorize!(:new, :device_admin)
    @device = Device.new
  end

  def create
    authorize!(:create, :device_admin)
    device_create(admin_device_index_path, device_params)
  end

  def show
    authorize!(:show, :device_admin)
    @inspection = Inspection.new
    device_show(@device)
  end

  def edit
    authorize!(:edit, :device_admin)
  end

  def update
    authorize!(:update, :device_admin)
    device_update(@device, device_params, admin_device_path)
  end

  def destroy
    authorize!(:destroy, :device_admin)
    @device.destroy
    redirect_to(admin_device_index_path)
  end

  def create_inspection
    create_inspection_for_device(Device.find_by_id(params[:device_id]))
  end

  private

  def set_device
    @device = Device.find(params[:id])
  end

  def device_params
    params.require(:device).permit(:inventory_id,
                                   :tabel_id,
                                   :serial_id,
                                   :device_model_id,
                                   :device_reg_group_id,
                                   :year_of_production,
                                   :year_of_commissioning,
                                   :supplementary_kit_id)
  end
end
