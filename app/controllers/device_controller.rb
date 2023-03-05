class DeviceController < ApplicationController
  def show
    @device = Device.find(params[:id])
    supplementary_kit_id = SupplementaryKit.find(@device.device_model.supplementary_kit_id)
    @devices = DeviceModel.where(supplementary_kit_id:)
  end

  def index
    @query = Device.ransack(params[:q])
    @devices = @query.result.
      includes(:device_model).
      order(:tabel_id).
      page(params[:page]).
      per(params[:per_page])
  end

  def update
    @device = Device.find(params[:id])
    if @device.update(device_params)
      redirect_to(device_path)
    else
      render(:edit)
    end
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy
    redirect_to(device_index_path)
  end

  def edit
    @device = Device.find(params[:id])
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

  def device_params
    params.require(:device).permit(:inventory_id,
                                   :tabel_id,
                                   :serial_id,
                                   :device_model_id,
                                   :device_reg_group_id,
                                   :year_of_production,
                                   :year_of_commissioning)
  end
end
