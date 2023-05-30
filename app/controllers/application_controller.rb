class ApplicationController < ActionController::Base
  include Pagy::Backend
  around_action :set_time_zone
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do
    render partial: 'shared/403'
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
    attributes_sign_up = [:first_name, :last_name, :tabel_id, :service_id, :timezone]
    attributes_update = [*attributes_sign_up.excluding(:service_id), :second_name, :email, :phone]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes_sign_up)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes_update)
  end
end
