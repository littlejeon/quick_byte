class Organization < ActiveRecord::Base
  has_many :user_organizations
  has_many :users, through: :user_organizations
  has_many :restaurants, through: :users
  validates_uniqueness_of :name
  validates_presence_of :name

  def domain_names
    self.domains.join(", ")
  end
end
