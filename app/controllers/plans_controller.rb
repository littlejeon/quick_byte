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

  def leave_plan
    respond_to do |format|
      format.html
      format.js {}
    end
    @plan = Plan.find(params[:id])
    @plan.users.delete(current_user)
  end

  def join_plan
    respond_to do |format|
      format.html
      format.js {}
    end
    @plan = Plan.find(params[:id])
    @plan.users << current_user
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update_attributes(plan_params)
      redirect_to @plan, :notice => "Your plan has been updated!"
    else
      render 'edit'
    end
  end

  private
  def plan_params
    params.require(:plan).permit(:name, :time, :restaurant_id, :restaurant)
  end
end
