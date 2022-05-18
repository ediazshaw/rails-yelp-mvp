class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show,:edit,:update,:destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show
    #get "restaurants/:id", to: "restaurants#show"
  end

  def new
    #create a blank instance of Restaurant
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    #find the specific restaurant
    #update the restaurant with the strong params
    @restaurant.update(restaurant_params)
    #redirect to updated restaurant
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    #find the restaurant with the specific id
    #destroy
    @restaurant.destroy
    #redirect to index page
    redirect_to restaurants_path
  end




  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end


  def restaurant_params
    # whitelisting the params that are passed in the form
    params.require(:restaurant).permit(:name,:address,:category)
  end
end
