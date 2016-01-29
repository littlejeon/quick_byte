class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  def average_wait_time
    wait_times = self.reviews.map do |review| 
      if review.wait_time 
        review.wait_time 
      end
    end.compact
      #binding.pry

    unless wait_times.empty?    
      sum_of_wait_times = wait_times.inject {|result, num| result + num }
      sum_of_wait_times / wait_times.count
    end

  end

  def average_rating
    all_ratings = self.reviews.map do |review| 
    #binding.pry
      if review.rating 
        review.rating 
      end
    end.compact

      unless all_ratings.empty?
        sum_of_ratings = all_ratings.inject {|result, num| result + num }
        sum_of_ratings / all_ratings.count
        end
  end

  def average_price
    all_prices = self.reviews.map do |review| 
      if review.price 
        review.price 
      end
    end.compact
      unless all_prices.empty?
    sum_of_prices = all_prices.inject {|result, num| result + num }
    sum_of_prices / all_prices.count
  end
  end

  def comments
    self.reviews.map { |review| review.comment}
  end

end

