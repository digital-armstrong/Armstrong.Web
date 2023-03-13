class ManufacturerController < ApplicationController
  def index
    @query = Manufacturer.ransack(params[:q])
    @manufacturers = @query.result.
      order(:name).
      page(params[:page]).
      per(params[:per_page])
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
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

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
    if @manufacturer.update(manufacturer_params)
      redirect_to(manufacturer_path)
    else
      render(:edit)
    end
  end

  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.destroy
    redirect_to(manufacturer_index_path)
  end

  private

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
