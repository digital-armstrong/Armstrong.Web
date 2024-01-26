class Admin::AdminController < ApplicationController
  load_and_authorize_resource
  def index
    redirect_to(admin_users_path)
  end
end
