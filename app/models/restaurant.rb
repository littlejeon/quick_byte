class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  def average_wait_time
    wait_times = self.reviews.map { |review| review.wait_time }
    sum_of_wait_times = wait_times.inject {|result, num| result + num }
    sum_of_wait_times / wait_times.count
  end

  def average_rating
    all_ratings = self.reviews.map { |review| review.rating }
    sum_of_ratings = all_ratings.inject {|result, num| result + num }
    sum_of_ratings / all_ratings.count
  end

  def average_price
    all_prices = self.reviews.map { |review| review.rating }
    sum_of_prices = all_prices.inject {|result, num| result + num }
    sum_of_prices / all_prices.count
  end

  def comments
    self.reviews.map { |review| review.comment}
  end

end
