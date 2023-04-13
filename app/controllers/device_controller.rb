class DeviceController < ApplicationController
  before_action :authenticate_user!
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  def show
    unless @device.supplementary_kit_id.nil?
      @device_components = DeviceComponent.where(supplementary_kit_id: @device.supplementary_kit_id)
    end
  end

  def index
    @query = Device.ransack(params[:q])
    @pagy, @devices = pagy(@query.result.
      includes(:device_model, :supplementary_kit).
      order(:tabel_id))
    # authorize! :read, @devices
  end

  def update
    if @device.update(device_params)
      redirect_to(device_path)
    else
      render(:edit)
    end
  end

  def destroy
    @device.destroy
    redirect_to(device_index_path)
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      redirect_to(device_index_path)
    else
      render(:new)
    end
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
