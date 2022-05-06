class ApplicationController < ActionController::Base
  add_flash_types :success, :danger, :info, :warning

  def current_user
    User.first
  end
end
