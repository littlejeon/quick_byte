class PlansUser < ActiveRecord::Base

  belongs_to :user
  belongs_to :plan
    #validates :user, uniqueness: true

end
