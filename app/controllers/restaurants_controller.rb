class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  before_action :require_login, except: [:index, :show]

  def index
    #@reviews = Review.all.order_by_submitted_date#.order_by_date
    @restaurants = Restaurant.all.alphabetical_order #show ALL restaurants
    #@reviews = @restaurant.reviews
    #@review = @restaurant.review
    #@reviews = @restaurant.reviews
  end

  def show
    @reviews = @restaurant.reviews
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

end
