class InspectionController < ApplicationController
  def index
    @query = Inspection.ransack(params[:query])
    @query.sorts = ['created_at desc']
    @inspections = @query.result.
      page(params[:page]).
      per(params[:per])
  end

  def new; end

  def create; end

  def show; end

  def edit; end

  def update; end
end
