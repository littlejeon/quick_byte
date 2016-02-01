class Plan < ActiveRecord::Base
  has_many :users
  belongs_to :restaurant
  belongs_to :organization


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
