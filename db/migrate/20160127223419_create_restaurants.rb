class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :location
      t.string :type
      t.string :dietary_needs

      t.timestamps null: false
    end
  end
end
