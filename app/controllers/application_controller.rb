class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize
  helper_method :current_user, :logged_in?


private

  def authorize
    redirect_to root_path, notice: "Log in to edit or delete your post" unless logged_in?
  end

  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

end
