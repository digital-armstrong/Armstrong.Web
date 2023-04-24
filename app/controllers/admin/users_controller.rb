class Admin::UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:edit, :update]

  def index
    params[:q] ||= {}
    if params[:q][:created_at_lteq].present?
      params[:q][:created_at_lteq] = params[:q][:created_at_lteq].to_date.end_of_day
    end
    if params[:q][:updated_at_lteq].present?
      params[:q][:updated_at_lteq] = params[:q][:updated_at_lteq].to_date.end_of_day
    end

    @query = User.ransack(params[:q])
    @pagy, @users = pagy(@query.result.
      order(:tabel_id))
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    if @user.update(user_params)
      flash[:success] = 'User was updated'
      redirect_to(admin_users_path)
    else
      flash.now[:warning] = "User wasn't updated"
      render(:edit)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    user_params[:role] ||= 'engineer'

    if @user.save
      flash[:success] = 'User was added'
      redirect_to(admin_users_path)
    else
      render(:new)
    end
  end

  def destroy
    user = User.find(params[:id])
    assigned_inspections_count = Inspection.where(creator_id: params[:id]).or(Inspection.where(performer_id: params[:id])).count + user.posts.count

    if assigned_inspections_count.zero?
      @user.destroy
    else
      flash[:error] = 'Ошибка! На пользователя ссылаются инспекции!'
    end
    redirect_to(admin_users_path)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :second_name,
                                 :tabel_id,
                                 :email,
                                 :name,
                                 :phone,
                                 :password,
                                 :password_confirmation,
                                 :role)
  end
end
