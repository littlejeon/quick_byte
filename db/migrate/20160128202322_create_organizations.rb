class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :location
      t.string :logo_url

      t.timestamps null: false
    end
  end
end
