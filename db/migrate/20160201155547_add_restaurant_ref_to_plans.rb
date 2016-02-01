class AddRestaurantRefToPlans < ActiveRecord::Migration
  def change
    add_reference :plans, :restaurant, index: true, foreign_key: true
  end
end
