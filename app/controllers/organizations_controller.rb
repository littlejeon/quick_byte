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

  def create
    @organization = Organization.create(org_params)
    current_user.organizations << @organization
    user_organization = current_user.user_organizations.find_by(organization_id: @organization.id)
    user_organization.update(admin: true)
    flash[:notice] = "You just created a group! You are now the admin."
    redirect_to @organization
  end

  def show
    @organization = Organization.find(params[:id])
    @user = UserOrganization.find_by(organization_id: @organization.id)
    # binding.pry
    # redirect_to '/organizations/@organization.name'
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    @organization.update(org_params)
    redirect_to @organization
  end

  private

  def org_params
    params.require(:organization).permit(:name, :location, :logo_url, :domain_list)
  end

end
