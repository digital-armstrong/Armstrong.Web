class DeviceController < ApplicationController
  def show; end

  def index
    @query = Device.ransack(params[:q])
    @devices = @query.result.
      order(:tabel_id).
      page(params[:page]).
      per(params[:per_page])
  end
end
