class ApplicationController < ActionController::Base
  add_flash_types :success, :danger, :info, :warning

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:Name, :email, :Photo, :Bio, :PostsCounter, :password , :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:Name, :email, :Photo, :Bio, :PostsCounter, :password , :password_confirmation])
  end
end
