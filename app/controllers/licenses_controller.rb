class LicensesController < ApplicationController
  def show
    @locale = params[:locale]
  end
end
