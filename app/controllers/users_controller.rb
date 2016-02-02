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
      current_user.send(:confirmation_token)
      UserMailer.registration_confirmation(current_user).deliver_now
      flash[:success] = "Please confirm your email address to continue"
      redirect_to organizations_path
        # if current_user.email_confirmed
        #   current_user.organizations << organization
        #   current_user.save
        #   redirect_to organization_path(organization), :notice => "Thanks for joining #{organization.name}!"
    else
      flash[:error] = "In order to join this group you must have"
        @organization = Organization.find(params[:user][:organizations])
        @user = current_user
        render 'join_request'
      end
    end

  # def confirm_email
  #   user = User.find_by_confirm_token(params[:id])
  #   binding.pry
  #   if user
  #      user.email_activate
  #     redirect_to organization_path
  #   else
  #     flash[:error] = "Sorry. User does not exist"
  #     redirect_to root_url
  #   end
  # end

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
