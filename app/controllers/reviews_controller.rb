class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    redirect_to @review.restaurant
  end

  def show
    @review = Review.find(params[:id])
  end

  private
  def review_params
    params.require(:review).permit(:wait_time, :comment, :price, :rating, :restaurant_id)
  end

end
