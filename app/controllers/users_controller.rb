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
    user_domain = current_user.domain_name
    organization = Organization.find(params[:user][:organizations])
    # binding.pry
    domains = organization.domain_names
    if domains.include?(user_domain)
      current_user.set_confirmation_token
      current_user.save(validate: false)
      UserMailer.registration_confirmation(current_user, organization.id).deliver_now
      flash[:success] = "Please confirm your email address to continue"
      redirect_to organizations_path
    else
      flash[:error] = "In order to join this group you must have"
        @organization = Organization.find(params[:user][:organizations])
        @user = current_user
        render 'join_request'
      end
    end

  def add
    @user = current_user
  end

  def dashboard
    @user = current_user
  end
  
  def edit
  end

  def update
    @user = User.find(params[:id])
    binding.pry
    if @user.update_attributes(user_params)
      redirect_to @user, :notice => "Your settings have been updated!"
      # Handle a successful update.
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email, :avatar)
  end

end
