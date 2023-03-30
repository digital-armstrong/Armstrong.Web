class InspectionController < ApplicationController
  def index
    @query = Inspection.ransack(params[:q])
    @query.sorts = ['created_at desc']
    @inspections = @query.result.
      includes(:device, :creator, :performer).
      page(params[:page]).
      per(params[:per_page])
  end

  def show
    @inspection = Inspection.find(params[:id])
  end

  def new
    @inspection = Inspection.new
  end

  def create
    @inspection = Inspection.new(inspection_params)
    if @inspection.save
      redirect_to(inspection_index_path)
    else
      render(:new)
    end
  end

  def edit
    @inspection = Inspection.find(params[:id])
  end

  def update
    @inspection = Inspection.find(params[:id])
    if @inspection.update(inspection_params)
      redirect_to(inspection_path)
    else
      render(:edit)
    end
  end

  def destroy
    @inspection = Inspection.find(params[:id])
    @inspection.destroy
    redirect_to(inspection_index_path)
  end

  private

  def inspection_params
    params.require(:inspection).permit(
      :device_id,
      :creator_id,
      :performer_id,
      :conclusion,
      :conclusion_date,
      :description,
      :state,
    )
  end
end
