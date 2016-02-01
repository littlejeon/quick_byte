class PlansController < ApplicationController

  def new
    @plan = Plan.new
  end

  def create

    @plan = Plan.create(plans_params)
    redirect_to @plan
  end


  def index
    @plans = Plan.all
    # restaurant_id = @plan.restaurant_id 
    # @plan.restaurant = Restaurant.find_by id: restaurant_id
  end

  def show
    @plan = Plan.find(params[:id])
    @plans = Plan.all
    @plan_users = []
    @plan_users << @current_user 
    #@plan.user = @users << @current_user
    #@plan.user = User.find(session["plan.user.user.key"][0][0])
    #binding.pry
    # restaurant_id = @plan.restaurant_id 
    # @plan.restaurant = Restaurant.find_by id: restaurant_id
   

  end



  private
  
  def plans_params
    params.require(:plan).permit(:time, :restaurant_id, :restaurant)
  end


end
