class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  private

  def layout_by_resource
    devise_controller? ? "auth" : "application"
  end
end