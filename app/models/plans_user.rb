class PlansUser < ActiveRecord::Base

  belongs_to :user
  belongs_to :plan
#  before_save :user_unique_in_plan?
# #     #validates :user, uniqueness: true


#  def user_unique_in_plan?
#   binding.pry
#     if self.user_id == user.id
#       errors.add(:plans_user, "You cannot enter a plan twice")
#       binding.pry
        
#       else
#         self.save
#     end
#  end


 end


# class Student < ActiveRecord::Base
#   after_create :slugify!

#   def slugify!
#     self.slug = self.name.downcase.gsub(' ','-') 
#         if self.name != nil
#     self.save
#   end
