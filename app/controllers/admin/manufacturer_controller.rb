class Admin::ManufacturerController < ApplicationController
  include ManufacturerConcern
  load_and_authorize_resource
  before_action :set_manufacturer, only: [:edit, :update, :destroy]

  def index
    @query = Manufacturer.ransack(params[:q])
    @pagy, @manufacturers = pagy(@query.result.
      order(:name))
  end

  def new
    authorize!(:new, :manufacturer_admin)
    @manufacturer = Manufacturer.new
  end

  def create
    authorize!(:create, :manufacturer_admin)
    manufacturer_create
  end

  def update
    if @manufacturer.update(manufacturer_params)
      redirect_back(fallback_location: root_path)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    assigned_device_models_count = DeviceModel.where(manufacturer_id: params[:id]).count

    if assigned_device_models_count.zero?
      @manufacturer.destroy
    else
      flash[:error] = 'Ошибка! На этого производителя ссылаются модели приборов!'
    end
    redirect_to(admin_manufacturer_index_path)
  end

  private

  def set_manufacturer
    @manufacturer = Manufacturer.find(params[:id])
  end

  def manufacturer_params
    params.require(:manufacturer).permit(
      :name,
      :adress,
      :phone,
      :email,
      :site_url,
    )
  end
end
