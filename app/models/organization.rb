class Organization < ActiveRecord::Base
  has_many :user_organizations
  has_many :users, through: :user_organizations
  has_many :plans, through: :users

  has_many :restaurants, through: :users
  validates_uniqueness_of :name
  validates_presence_of :name
  validates_uniqueness_of :restaurants, :users

  has_attached_file :logo,
  styles: { :large => "300x" },
  :default_url => '/assets/default_:style.png'
  validates_attachment :logo,
  content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
  size: { in: 0..100.kilobytes }

  def domain_names
    self.domains.join(", ")
  end

  def domain_names=(domain_names)
    self.domains.split(",")
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
