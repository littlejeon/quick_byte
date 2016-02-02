class TypesController < ApplicationController

  def new
     @cuisine = Cuisine.new
  end

  def create
    cuisine = Cuisine.new(cuisine_params)
    if cuisine.save
      redirect_to cuisine, :notice => "New food cuisine added succesfully!"
    else
      @cuisine = Cuisine.new
      flash[:error] = "This cuisine already exists, try again."
      render 'new'
    end
  end

  def index
    @cuisines = Cuisine.all
  end

  def show
    @cuisine = Cuisine.find(params[:id])
  end

  private

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end
end
