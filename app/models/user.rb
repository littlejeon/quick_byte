class User < ActiveRecord::Base
  belongs_to :organization
  has_many :reviews
  has_many :restaurants, through: :reviews
  has_many :types
  has_secure_password
end
