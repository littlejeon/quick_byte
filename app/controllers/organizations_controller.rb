class OrganizationsController < ApplicationController

  # before_action :is_member?, only: [:join, :show, :edit, :update]

  skip_before_action :authorize, only: [:new, :create]

  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:token])
    organization = Organization.find(params[:id])
    if user
       user.send('email_activate')
       user.save(validate: false)
       organization.users << user
       redirect_to organization_path
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
  end

  def grant_access
    user = User.find_by_confirm_token(params[:token])
    organization = Organization.find(params[:id])
    if user
       user.send('email_activate')
       user.save(validate: false)
       organization.users << user
       redirect_to organization_path
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
  end

  def create
    @organization = Organization.new(org_params)
    current_user.organizations << @organization
    user_organization = current_user.user_organizations.find_by(organization_id: @organization.id)
    @organization.domains << params[:organization][:domains]
    user_organization.update(admin: true)
    @organization.save
    flash[:notice] = "You just created a group! You are now the admin."
    redirect_to @organization
  end

  def show
    @organization = Organization.find(params[:id])
    # redirect_to '/organizations/@organization.name'
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def remove_user
    @organization = Organization.find(params[:organization])
    @user = User.find(params[:id])
    @organization.users.destroy(@user)
    redirect_to @organization
  end

  def update
    current_organization = Organization.find(params[:id])
    @organization = current_organization.update_attributes(org_params)
    binding.pry
    redirect_to @organization
  end

  private

  def org_params
    params.require(:organization).permit(:name, :location, :logo, :domain_names)
  end

end
