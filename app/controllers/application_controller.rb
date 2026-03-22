# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :admin?

  def current_user
    # For use inside the complete application
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def admin?
    current_user&.role == "admin" && current_user&.username == "sudhan@gmail.com"
  end

  def require_login
    unless logged_in?
      flash[:alert] = "Please log in."
      redirect_to login_path
    end
  end

  def require_admin
    unless admin?
      flash[:alert] = "Access denied."
      redirect_to user_path
    end
  end
end