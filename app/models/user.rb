class User < ActiveRecord::Base
  belongs_to :organization
  has_many :reviews
  has_many :plans_users
  has_many :plans, through: :plans_users
  has_many :restaurants, through: :reviews
  has_secure_password
end
