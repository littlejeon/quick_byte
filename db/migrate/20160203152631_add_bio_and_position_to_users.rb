class AddBioAndPositionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text
    add_column :users, :position, :string
  end
end
