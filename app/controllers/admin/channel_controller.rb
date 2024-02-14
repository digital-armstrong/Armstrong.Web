class Admin::ChannelController < ApplicationController
  include ChannelConcern
  load_and_authorize_resource
  # before_action :set_building, only: [:show, :edit, :update, :destroy]

  def index
    channel_index
  end
end
