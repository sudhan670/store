# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user.role == "admin" ? admin_path : user_path
    else
      flash[:alert] = "Invalid email or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end