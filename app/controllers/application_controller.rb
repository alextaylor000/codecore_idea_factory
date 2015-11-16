class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    current_user.present?
  end

  def authenticate_user
    unless user_signed_in?
      redirect_to login_path, notice: "You must be signed in to continue."
    end
  end

  def log_in_user(user)
    session[:user_id] = user.id
  end

  def log_out_user
    session[:user_id] = nil
  end

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :authenticate_user
  helper_method :log_in_user
  helper_method :log_out_user
end
