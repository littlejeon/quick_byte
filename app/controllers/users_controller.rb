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

  def request_access
    organization = Organization.find(params[:id])
    current_user.set_confirmation_token
    current_user.save(validate: false)
    UserMailer.request_access(organization.admin_emails, current_user, organization.id).deliver_now
    redirect_to organizations_path
    flash[:success] = "Waiting for Admin to Grant Access. Hold Tight"
  end

  def dashboard
    # @user = User.find(params[:id])
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
    @plan = Plan.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, :notice => "Your settings have been updated!"
    else
      render 'edit'
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :position, :bio, :password, :password_confirmation, :email, :avatar)
  end
end
