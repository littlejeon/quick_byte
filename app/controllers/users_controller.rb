class UsersController < ApplicationController
  skip_before_action :authorize, only: [:new, :create, :join]
  before_action :set_user, only: [:show, :edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, :notice => "Thank you for signing up!"
    else
      render :new
    end
  end

  def join
    user_domain = current_user.email.gsub(/.+@([^.]+.+)/, '\1')
    organization = Organization.find(params[:user][:organizations])
    domains = organization.domains.join(",")
    if domains.include?(user_domain)
      current_user.organizations << organization
      current_user.save
      redirect_to organization_path(organization), :notice => "Thanks for joining #{organization.name}!"
    else
      
    end
  end 

  def add
    @user = current_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email)
  end

end
