class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  before_action :require_login, except: [:index, :show]

  def index
    @restaurants = Restaurant.all.alphabetical_order #show ALL restaurants
  end

  def show
    @reviews = @restaurant.reviews
    @cuisines = @restaurant.cuisines
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

end
