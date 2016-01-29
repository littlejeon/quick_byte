class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.create(org_params)
    redirect_to @organization
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
