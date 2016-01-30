class Type < ActiveRecord::Base
  has_many :users
  has_many :restaurants
end
