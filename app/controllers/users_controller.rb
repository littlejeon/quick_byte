class UsersController < ApplicationController



  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    # @users = User.all
    # binding.pry
    # @user = User.find(user.id)
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

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email)
  end

end
