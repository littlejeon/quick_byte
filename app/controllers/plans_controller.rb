class PlansController < ApplicationController

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.create(plan_params)
    @plan.users << current_user
    @plan.host = current_user
    @plan.save
    redirect_to @plan
  end

  def index
    @plans = Plan.all
     respond_to do |format|
      format.html
      format.js {}
    end
    #render json: @plans
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def leave_plan
    @plan = Plan.find(params[:id])
    @plan.users.delete(current_user)
    @plan.users
    @plan.save

    respond_to do |format|
      format.html
      format.js {}
    end
  end

  def join_plan
    @plan = Plan.find(params[:id])
    @plan.users << current_user
    @plan.save

    respond_to do |format|
      format.html
      format.js {}
    end
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
