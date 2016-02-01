class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.date :date
      t.time :time
      t.datetime :datetime

      t.timestamps null: false
    end
  end
end
