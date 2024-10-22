class Admin::BuildingController < ApplicationController
  include BuildingConcern

  load_and_authorize_resource
  before_action :set_building, only: [:show, :edit, :update, :destroy]

  def index
    building_index
  end

  def new
    authorize!(:new, :building_admin)
    @building = Building.new
  end

  def create
    authorize!(:create, :building_admin)
    building_create
  end

  def update
    authorize!(:update, :building_admin)
    building_update
  end

  def destroy
    authorize!(:destroy, :building_admin)
    building_destroy
  end
end
