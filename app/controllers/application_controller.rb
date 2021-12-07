class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname, :city, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :nickname, :city, :photo])
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
