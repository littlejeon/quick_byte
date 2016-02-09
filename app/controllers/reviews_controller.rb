class ReviewsController < ApplicationController


  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    current_user.reviews << @review
    @restaurant = @review.restaurant
    # binding.pry
    respond_to do |format|
      format.js {}
      format.html {redirect_to @review.restaurant }
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  private
  def review_params
    params.require(:review).permit(:wait_time, :comment, :price, :rating, :restaurant_id)
  end

end
