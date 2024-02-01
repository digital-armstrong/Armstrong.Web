class Admin::RoomController < ApplicationController
  include RoomConsern

  load_and_authorize_resource
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    room_index
  end

  def new
    authorize!(:new, :room_admin)
    @room = Room.new
  end

  def create
    authorize!(:create, :room_admin)
    room_create
  end

  def update
    authorize!(:update, :room_admin)
    room_update
  end

  def destroy
    authorize!(:destroy, :room_admin)
    room_destroy
  end
end
