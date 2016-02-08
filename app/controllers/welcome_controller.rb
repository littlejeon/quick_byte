class WelcomeController < ApplicationController
  skip_before_action :authorize
  def index
    if logged_in?
      redirect_to dashboard_path
    else
      render :layout => "_home"
    end
  end
end
