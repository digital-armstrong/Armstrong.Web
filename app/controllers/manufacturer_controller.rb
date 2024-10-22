class ManufacturerController < ApplicationController
  include ManufacturerConcern
  load_and_authorize_resource

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    manufacturer_create
  end
end
