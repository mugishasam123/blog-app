class ApplicationController < ActionController::Base
  add_flash_types :success, :danger, :info, :warning

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[Name email Photo Bio PostsCounter password password_confirmation role])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[Name email Photo Bio PostsCounter password password_confirmation role])
  end
end
