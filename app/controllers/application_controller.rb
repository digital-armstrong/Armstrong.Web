class ApplicationController < ActionController::Base
  include Pagy::Backend
  around_action :set_time_zone
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do
    flash[:error] = 'Access denied!'
    redirect_to root_url
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  private

  def set_time_zone(&block)
    timezone = ''
    timezone = if current_user.nil?
                 'UTC'
               else
                 current_user.timezone
               end
    Time.use_zone(timezone, &block)
  end

  protected

  def configure_permitted_parameters
    attributes_sign_up = [:first_name, :last_name, :tabel_id, :email, :timezone]
    attributes_update = [*attributes_sign_up, :second_name, :phone]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes_sign_up)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes_update)
  end
end
