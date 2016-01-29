class User < ActiveRecord::Base
  has_many :reviews
  has_many :restaurants, through: :reviews

  def associate_reviews(review)
    self.reviews << review
  end
  
end
