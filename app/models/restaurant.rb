class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  def associate_reviews(review)
    self.reviews << review
  end

end
