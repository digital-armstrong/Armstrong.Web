# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_action :verify_authenticity_token, only: [:create]

  # rubocop:disable Lint/UselessMethodDefinition

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
    flash.delete(:notice)
    flash.delete(:success)
  end

  # DELETE /resource/sign_out
  def destroy
    super
    flash.delete(:notice)
    flash.delete(:success)
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

  # rubocop:enable Lint/UselessMethodDefinition
end
