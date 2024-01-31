class Admin::OrganizationController < ApplicationController
  include OrganizationConcern

  load_and_authorize_resource
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def index
    organization_index
  end

  def new
    authorize!(:new, :organization_admin)
    @organization = Organization.new
  end

  def create
    authorize!(:create, :organization_admin)
    organization_create
  end

  def update
    authorize!(:update, :organization_admin)
    organization_update
  end

  def destroy
    authorize!(:destroy, :organization_admin)
    organization_destroy
  end
end
