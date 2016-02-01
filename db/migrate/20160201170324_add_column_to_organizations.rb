class AddColumnToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :domains, :text, array:true, default:[]
  end
end
