class RestaurantsController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def index
    @reviews = Review.all.order_by_submitted_date#.order_by_date
    #@restaurants = Restaurant.reviews.all #show ALL restaurants
    #@reviews = @user.reviews
    #@review = @restaurant.review
    #@reviews = @restaurant.reviews
  end
end
