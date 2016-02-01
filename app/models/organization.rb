class Organization < ActiveRecord::Base
  has_many :users
  has_many :plans, through: :users
  has_many :restaurants, through: :users
end
