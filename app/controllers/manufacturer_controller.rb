class ManufacturerController < ApplicationController
  before_action :set_manufacturer, only: [:edit, :update, :destroy]

  def index
    @query = Manufacturer.ransack(params[:q])
    @pagy, @manufacturers = pagy(@query.result.
      order(:name))
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      redirect_to(manufacturer_index_path)
    else
      render(:new)
    end
  end

  def update
    if @manufacturer.update(manufacturer_params)
      redirect_to(manufacturer_path)
    else
      render(:edit)
    end
  end

  def destroy
    assigned_device_models_count = DeviceModel.where(manufacturer_id: params[:id]).count

    if assigned_device_models_count.zero?
      @manufacturer.destroy
    else
      flash[:error] = 'Ошибка! На этого производителя ссылаются модели приборов!'
    end
    redirect_to(manufacturer_index_path)
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
