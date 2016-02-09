class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @hash = Gmaps4rails.build_markers (@restaurant) do |restaurant, marker|
     marker.lat restaurant.latitude
     marker.lng restaurant.longitude
   end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
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
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      redirect_to @restaurant, :notice => "Your review has been updated!"
    else
      render 'edit'
    end
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :dietary_needs, :cuisine_id, :address, :latitude, :longitude)
  end
end
