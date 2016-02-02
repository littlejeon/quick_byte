class RenameTypeIdColumnRestaurants < ActiveRecord::Migration
  def change
    rename_column :restaurants, :type_id, :cuisine_id
  end
end
