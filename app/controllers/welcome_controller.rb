class WelcomeController < ApplicationController
  skip_before_action :authorize
  def index
    render :layout => "_home"
  end
end
