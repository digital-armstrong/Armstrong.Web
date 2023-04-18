class DeviceController < ApplicationController
  include DeviceConcern
  before_action :authenticate_user!
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @query = Device.ransack(params[:q])
    @pagy, @devices = pagy(@query.result.
      includes(:device_model, :supplementary_kit).
      order(:tabel_id))
  end

  def new
    @device = Device.new
  end

  def create
    device_create(device_index_path, device_params)
  end
  
  def show
    device_show(@device)
  end

  def update
    device_update(@device, device_params, device_path)
  end

  def destroy
    @device.destroy
    redirect_to(device_index_path)
  end

  def download
    query = Device.ransack(params[:q])
    devices = query.result.
      includes(:device_model).
      order(:tabel_id)
    respond_to do |format|
      format.pdf { send_data(devices.to_pdf, filename: "table-#{Date.today}.pdf") }
    end
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
