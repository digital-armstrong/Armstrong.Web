class Admin::ChannelController < ApplicationController
  include ChannelConcern
  load_and_authorize_resource
  before_action :set_channel, only: [:show, :edit, :update, :destroy]

  def index
    channel_index
  end

  def new
    @channel = Channel.new
  end

  def create
    channel_create
  end

  def update
    channel_update
  end

  def destroy
    authorize!(:destroy, :channel_admin)
    channel_destroy
  end
end
