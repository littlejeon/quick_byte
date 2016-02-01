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

    #binding.pry
    # restaurant_id = @plan.restaurant_id 
    # @plan.restaurant = Restaurant.find_by id: restaurant_id
  end

  def show
    @plan = Plan.find(params[:id])


    # @plan_users = []
    # @plan_users << @current_user 
    #@plan.user = @users << @current_user
    #@plan.user = User.find(session["plan.user.user.key"][0][0])
    #binding.pry
    # restaurant_id = @plan.restaurant_id 
    # @plan.restaurant = Restaurant.find_by id: restaurant_id
   

  end

  def join_plan
    @plan.users << current_user 
  end



  private
  
  def plans_params
    params.require(:plan).permit(:time, :restaurant_id, :restaurant)
  end


end
