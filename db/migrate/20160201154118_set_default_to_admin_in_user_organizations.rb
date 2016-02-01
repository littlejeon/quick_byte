class SetDefaultToAdminInUserOrganizations < ActiveRecord::Migration
  def change
    change_column :user_organizations, :admin, :boolean, :default => false
  end
end
