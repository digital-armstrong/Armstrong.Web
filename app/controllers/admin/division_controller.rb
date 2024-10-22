class Admin::DivisionController < ApplicationController
  include DivisionConcern
  load_and_authorize_resource
  before_action :set_division, only: [:show, :edit, :update, :destroy]

  def index
    division_index
  end

  def new
    authorize!(:new, :division_admin)
    @division = Division.new
  end

  def create
    authorize!(:create, :division_admin)
    division_create
  end

  def update
    authorize!(:update, :division_admin)
    division_update
  end

  def destroy
    authorize!(:destroy, :division_admin)
    division_destroy
  end
end
