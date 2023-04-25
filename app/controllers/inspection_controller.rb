class InspectionController < ApplicationController
  before_action :set_inspection, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  def index
    @query = Inspection.ransack(params[:q])
    @query.sorts = ['created_at desc']
    @pagy, @inspections = pagy(@query.result.
      includes(:device, :creator, :performer))
  end

  def new
    @inspection = Inspection.new
  end

  def create
    @inspection = Inspection.new(inspection_params.merge(creator_id: current_user.id))
    if @inspection.save
      redirect_to(inspection_index_path)
    else
      flash[:error] = inspection_params
      render(:new)
    end
  end

  def show
    @creator = User.find_by_id(@inspection.creator_id)
    @performer = User.find_by_id(@inspection.performer_id)
  end

  def update
    if @inspection.update(inspection_params)
      redirect_to(inspection_path)
    else
      render(:edit)
    end
  end

  def destroy
    @inspection.destroy
    redirect_to(inspection_index_path)
  end

  def set_state(condition)
    if condition
      yield
      redirect_to(inspection_path(@inspection))
    else
      flash[:error] = "Can't change state"
      redirect_to(inspection_path(@inspection))
    end
  end

  def accept_task
    set_state(@inspection.can_accept_task?) { @inspection.accept_task }
  end

  def complete_verification
    set_state(@inspection.can_complete_verification?) { @inspection.complete_verification }
    unless @inspection.update(conclusion_date: DateTime.now)
      flash.now[:error] = "Can't change state"
    end
  end

  def fail_verification
    set_state(@inspection.can_fail_verification?) { @inspection.fail_verification }
  end

  def send_to_repair
    set_state(@inspection.can_send_to_repair?) { @inspection.send_to_repair }
  end

  def return_from_repair
    set_state(@inspection.can_return_from_repair?) { @inspection.return_from_repair }
  end

  private

  def set_inspection
    @inspection = Inspection.find(params[:id])
  end

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
