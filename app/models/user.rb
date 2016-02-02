class User < ActiveRecord::Base
  has_many :user_organizations
  has_many :organizations, through: :user_organizations
  has_many :reviews
  has_many :plans_users
  has_many :plans, through: :plans_users
  has_many :restaurants, through: :reviews
  has_many :cuisines
  has_secure_password
  validates_uniqueness_of :email
  validates_presence_of :name, :email
  validates :password, :presence => true,
                       :length => {:within => 6..20}

    def domain_name
      self.email.gsub(/.+@([^.]+.+)/, '\1')
    end


end
