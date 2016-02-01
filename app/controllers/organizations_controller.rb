class OrganizationsController < ApplicationController

  skip_before_action :authorize, only: [:new, :create,]

  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
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

  def update
    @organization = Organization.update(org_params)
  end

  private

  def org_params
    params.require(:organization).permit(:name, :location, :logo_url, {:domains => []})
  end

end
