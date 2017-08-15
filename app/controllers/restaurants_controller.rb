class RestaurantsController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def index
    @restaurants = Restaurant.all.alphabetical_order #show ALL restaurants
  end
end
