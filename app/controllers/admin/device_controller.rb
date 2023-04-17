class Admin::DeviceController < ApplicationController
  def index
    @query = Device.ransack(params[:q])
    @pagy, @devices = pagy(@query.result.
      includes(:device_model, :supplementary_kit).
      order(:tabel_id))
  end
end
