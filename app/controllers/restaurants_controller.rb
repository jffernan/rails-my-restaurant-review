class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all.alphabetical_order #show ALL restaurants
  end
end
