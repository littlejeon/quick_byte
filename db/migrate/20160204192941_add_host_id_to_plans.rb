class AddHostIdToPlans < ActiveRecord::Migration
  def change
    add_reference :plans, :host, index: true
    add_foreign_key :plans, :users, column: :host_id
  end
end
