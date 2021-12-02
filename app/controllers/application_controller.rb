class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resources)
    groups_path
  end

  def after_sign_up_path_for(_resources)
    groups_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end
end
