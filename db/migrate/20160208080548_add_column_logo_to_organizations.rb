class AddColumnLogoToOrganizations < ActiveRecord::Migration
  def change
    add_attachment :organizations, :logo
  end
end
