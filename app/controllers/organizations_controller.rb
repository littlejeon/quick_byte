class OrganizationsController < ApplicationController

  skip_before_action :authorize, only: [:new, :create]

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.create(org_params)
    redirect_to @organization
    # @user = User.new(email: params[:organization][:user][:email])
    # if @user.save

    #   session[:user_id] = @user.id
    #   redirect_to @user, :notice => "Thank you for signing up!"
    # else
    #   render :new
    # end
    # @organization.users << @user
    # binding.pry
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.update(org_params)
  end

  private

  def org_params
    params.require(:organization).permit(:name, :location, :logo_url)
  end

end
