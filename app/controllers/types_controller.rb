class TypesController < ApplicationController

  def new
     @type = Type.new
  end

  def create
    type = Type.new(type_params)
    if type.save
      redirect_to type, :notice => "New food type added succesfully!"
    else
      @type = Type.new
      flash[:error] = "This type already exists, try again."
      render 'new'
    end
  end

  def index
    @type = Type.all
  end

  def show
    @type = Type.find(params[:id])
  end

  private

  def type_params
    params.require(:type).permit(:name)
  end
end
