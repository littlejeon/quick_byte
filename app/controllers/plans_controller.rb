class PlansController < ApplicationController

  def new
    @plan = Plan.new
  end


  def create
    @plan = Plan.create(plan_params)
    @plan.host = current_user
    @plan.users << current_user
    @plan.save
    redirect_to @plan
  end


  def index

    @plans = Plan.all
    #binding.pry
     respond_to do |format|
      format.html
      format.js {}
    end
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def leave_plan
    @plan = Plan.find(params[:id])
    @plan.users.delete(current_user)
    @plan.users
    @plan.save
    @in_plan = @plan.users.include?(current_user)
    respond_to do |format|
      format.html
      format.js {}
    end
  end

  def join_plan
    @plan = Plan.find(params[:id])
    
    if !@plan.users.include?(current_user)
      @plan.users << current_user
      @plan.save
    else 

      flash[:error] = "You are already participating in this plan."
    end

    @in_plan = @plan.users.include?(current_user)

    #binding.pry
    respond_to do |format|
      format.html
      format.js {}
    end

  end


  # if user
  #      user.send('email_activate')
  #      user.save(validate: false)
  #      organization.users << user
  #      redirect_to organization_path
  #   else
  #     flash[:error] = "Sorry. User does not exist"
  #     redirect_to root_url
  #   end





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
