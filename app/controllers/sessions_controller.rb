class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, :notice => "Welcome back, #{user.name}"
    else
      flash[:notice] = "Invalid email or password"
      render "new"
    end
  end

  def new
    @user = User.new
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end

private

def session_params
  params.require(:session).permit(:user_id)
end
