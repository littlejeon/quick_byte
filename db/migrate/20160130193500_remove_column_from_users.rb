class RemoveColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :organization_id, :string
  end
end
