class Plan < ActiveRecord::Base
  has_many :plans_users
  has_many :users, through: :plans_users
  belongs_to :restaurant
  belongs_to :organization
  belongs_to :host, class_name: User


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
