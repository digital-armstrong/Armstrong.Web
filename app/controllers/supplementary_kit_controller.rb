class SupplementaryKitController < ApplicationController
  include SupplementaryKitConcern
  load_and_authorize_resource

  def new
    @supplementary_kit = SupplementaryKit.new
  end

  def create
    supplementary_kit_create
  end
end
