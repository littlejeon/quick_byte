class Plan < ActiveRecord::Base
  has_many :plans_users
  has_many :users, through: :plans_users
  belongs_to :restaurant
  belongs_to :organization
  belongs_to :host, class_name: User
  #validates_presence_of :time, :date, :restaurant
  #validates :user, uniqueness: true
  #validates :user, uniqueness: {message: "already in the plan"}


  def pretty_time
    @plan.time.strftime("%B %d at %I:%M %p")
  end

  # def todays_date?
  #   if Time.zone.today == params[:date]
  #   datetime = DateTime.now
  #   datetime.today?
  #   end

  # end

end
