class Organization < ActiveRecord::Base
  has_many :user_organizations
  has_many :users, through: :user_organizations
  has_many :plans, through: :users

  has_many :restaurants, through: :users
  validates_uniqueness_of :name
  validates_presence_of :name

  def domain_names
    self.domains.join(", ")
  end

  def admins
    admins = self.user_organizations.where(admin: "true")
    admins.map { |admin| admin.user_id}
  end

  def admin_emails
    self.admins.map do |id|
      admin = User.find(id)
      admin.email
    end
  end
end
