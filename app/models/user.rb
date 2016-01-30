class User < ActiveRecord::Base
  has_many :user_organizations
  has_many :organizations, through: :user_organizations
  has_many :reviews
  has_many :restaurants, through: :reviews
  has_secure_password
end
