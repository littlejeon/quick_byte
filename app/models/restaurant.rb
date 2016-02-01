class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews
  belongs_to :type

  def average(category)
    category_collection = self.reviews.map do |review|
      if review.send(category)
         review.send(category)
    end
  end.compact

    unless category_collection.empty?
      sum_of_selection = category_collection.inject { |result, num| result + num }
      sum_of_selection / category_collection.count
    end
  end
end
