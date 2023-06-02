class InspectionController < ApplicationController
  before_action :set_inspection, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def tasks(condition, method_name)
    params[:q] ||= {}

    if params[:q][:conclusion_date_lteq].present?
      params[:q][:conclusion_date_lteq] = params[:q][:conclusion_date_lteq].to_date.end_of_day
    end

    if params[:q][:state_eq].present?
      @selected_state = params[:q][:state_eq].to_sym
    end
    @query = Inspection.ransack(params[:q])
    @query.sorts = ['updated_at desc']
    @previous_action = method_name
    if method_name != :service_tasks
      @pagy, @inspections = pagy(@query.result.where(condition).
        includes(:device, :creator, :performer))
    else
      @pagy, @inspections = pagy(@query.result.joins(:device).where(condition).
      includes(:device, :creator, :performer))
    end
  end

  def new_tasks
    @states_to_show = Inspection::STATES.select { |s| s.in?([:task_created]) }
    tasks({ performer_id: nil, state: @states_to_show.keys }, __callee__)
  end

  def my_tasks
    @states_to_show = Inspection::STATES.excluding(:verification_successful, :closed, :task_created)
    tasks({ performer_id: current_user.id, state: @states_to_show.keys }, __callee__)
  end

  def completed_tasks
    @states_to_show = Inspection::STATES.select { |s| s.in?([:verification_successful, :closed]) }
    tasks({ state: @states_to_show.keys }, __callee__)
  end

  def all_tasks
    @states_to_show = Inspection::STATES
    tasks(nil, __callee__)
  end

  def service_tasks
    @states_to_show = Inspection::STATES
    tasks({ devices: { service_id: current_user.service_id } }, __callee__)
  end

  def new
    @inspection = Inspection.new
  end

  def create
    @inspection = Inspection.new(inspection_params.merge(creator_id: current_user.id))
    if @inspection.save
      if @inspection.performer.present?
        @inspection.accept_task
      end
      redirect_to(new_tasks_inspection_index_path)
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def show
    @creator = User.find_by_id(@inspection.creator_id)
    @performer = User.find_by_id(@inspection.performer_id)
    @previous_action = params[:previous_action]
  end

  def update
    if @inspection.update(inspection_params)
      redirect_to(inspection_path)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @inspection.destroy
    action = action = if params[:previous_action].present?
                        params[:previous_action]
                      else
                        'new_tasks'
                      end
    redirect_to(action:)
  end

  def set_state(condition)
    if condition
      yield
      redirect_back(fallback_location: new_tasks_inspection_index_path)
      true
    else
      flash[:error] = "Can't change state"
      redirect_back(fallback_location: new_tasks_inspection_index_path)
    end
  end

  def accept_task
    if set_state(@inspection.can_accept_task?) { @inspection.accept_task }
      @inspection.update(performer_id: current_user.id)
    else
      flash.now[:error] = "Can't change state"
    end
  end

  def complete_verification
    if @inspection.can_complete_verification?
      @inspection.complete_verification
      @inspection.update(conclusion_date: DateTime.now)
      redirect_to(edit_inspection_path(@inspection))
    else
      flash.now[:error] = "Can't change state"
      redirect_back(fallback_location: new_tasks_inspection_index_path)
    end
  end

  def fail_verification
    set_state(@inspection.can_fail_verification?) { @inspection.fail_verification }
  end

  def close
    if @inspection.can_close?
      @inspection.close
      @inspection.update(conclusion_date: DateTime.now)
      redirect_to(edit_inspection_path(@inspection))
    else
      flash.now[:error] = "Can't change state"
      redirect_back(fallback_location: new_tasks_inspection_index_path)
    end
  end

  def send_to_repair
    set_state(@inspection.can_send_to_repair?) { @inspection.send_to_repair }
  end

  def return_from_repair
    set_state(@inspection.can_return_from_repair?) { @inspection.return_from_repair }
  end

  def send_from_repair_to_verification
    set_state(@inspection.can_send_from_repair_to_verification?) { @inspection.send_from_repair_to_verification }
  end

  def send_from_repair_to_close
    if set_state(@inspection.can_send_from_repair_to_close?) { @inspection.send_from_repair_to_close }
      @inspection.update(conclusion_date: DateTime.now)
    else
      flash.now[:error] = "Can't change state"
    end
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
      :type_target,
      :conclusion,
      :conclusion_date,
      :description,
      :state,
    )
  end
end
