class UsersController < ApplicationController
  def new; end

  def create
    user = User.new(
      username: params[:email],
      password: params[:password],
      role:     params[:role]
    )
    if user.save
      session[:user_id] = user.id
      redirect_to user.role == "admin" ? admin_path : user_path
    else
      flash[:alert] = user.errors.full_messages.join(", ")
      redirect_to signup_path
    end
  end

  def signup
    @user = User.new(
      email: params[:email],
      password: params[:password],
      role: params[:role]
    )

    if @user.save
      UserMailer.welcome_email(@user).deliver_now  
      flash[:notice] = "Account created! Check your email."
      redirect_to login_path
    else
      flash[:alert] = "Signup failed"
      render :new
    end
  end
end