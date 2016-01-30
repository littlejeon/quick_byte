class AddTypeReferenceToRestaurant < ActiveRecord::Migration
  def change
    add_reference :restaurants, :type, index: true, foreign_key: true
  end
end
