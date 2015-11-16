class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      log_in_user(@user)
      redirect_to @user, notice: "Welcome back, #{@user.username}! What's your big idea today?"
    else
      flash[:danger] = "Invalid credentials."
      render :new
    end
  end

  def destroy
    log_out_user
    redirect_to root_path, notice: "See you next time!"
  end
end
