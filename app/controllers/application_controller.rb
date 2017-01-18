class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.admin?
      welcome_index_path
    else
      search_path
    end
  end

  protected

  def configure_permitted_parameters

    # registration_params = [ :email, :first_name, :last_name, :password, :password_confirmation ]
    # devise_parameter_sanitizer.for(:sign_up) {
    #   |u| u.permit(registration_params)
    # }

    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :first_name, :last_name, :password, :password_confirmation])
  end
end
