class Admin::ServerController < ApplicationController
  include ServerConcern

  load_and_authorize_resource
  # before_action :set_server, only: [:show, :edit, :update, :destroy]

  def index
    server_index
  end

  def new
    @server = Server.new
  end

  def create
    server_create
  end

  def update
    server_update
  end

  def destroy
    server_destroy
  end
end
