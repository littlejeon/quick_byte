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
    #binding.pry
    @plan.users.delete(current_user)
    @plan.users
    @plan.save

    respond_to do |format|
      format.html
      format.js {}
    end
  end

  def join_plan

    #binding.pry
    @plan = Plan.find(params[:id])
    @plan.users << current_user
    @plan.save
    
    respond_to do |format|
      format.html
      format.js {}
    end

  end

  private
  def plans_params
    params.require(:plan).permit(:name, :time, :restaurant_id, :restaurant)
  end
end
