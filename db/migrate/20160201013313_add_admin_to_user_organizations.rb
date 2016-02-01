class AddAdminToUserOrganizations < ActiveRecord::Migration
  def change
    add_column :user_organizations, :admin, :boolean
  end
end
