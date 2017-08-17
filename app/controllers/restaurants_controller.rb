class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  before_action :require_login, except: [:index, :show]

  def index
    @cuisines = Cuisine.all
    @restaurants = Restaurant.all.alphabetical_order #show ALL restaurants
  end

  def show
    @cuisine = Cuisine.find(params[:id])
    @reviews = @restaurant.reviews
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

end
