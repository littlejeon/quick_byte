class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # binding.pry
    restaurant = Restaurant.create(restaurant_params)
    unless params[:cuisine].empty?
      cuisine = Cuisine.create(name: params[:cuisine][:name])
    end
    cuisine.restaurants << restaurant
    redirect_to restaurant
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    restaurant = Restaurant.update(restaurant_params)
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :dietary_needs, :cuisine_id)
  end
end
