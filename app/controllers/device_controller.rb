class DeviceController < ApplicationController
  include DeviceConcern
  before_action :authenticate_user!
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  @seporator = ','

  def index
    device_index
  end

  def new
    @device = Device.new
  end

  def create
    device_create
  end

  def show
    @inspection = Inspection.new
    device_show(@device)
  end

  def update
    device_update(@device)
  end

  def destroy
    device_destroy(@device, device_index_path, device_path(@device))
  end

  def create_inspection
    create_inspection_for_device(Device.find_by_id(params[:device_id]))
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
end
