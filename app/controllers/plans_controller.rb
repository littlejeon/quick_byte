class PlansController < ApplicationController

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.create(plans_params)
    @plan.users << current_user
    redirect_to @plan
  end

  def index
    @plans = Plan.all

  end

  def show
    @plan = Plan.find(params[:id])
  end

  def join_plan
    respond_to do |format|
      format.html
      format.js {}
    end
    @plan.users << current_user
  end

  private
  def plans_params
    params.require(:plan).permit(:time, :restaurant_id, :restaurant)
  end
end
