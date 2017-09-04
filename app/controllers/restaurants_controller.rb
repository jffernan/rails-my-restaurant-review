class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  before_action :require_login, except: [:index, :show]

  def index
    @restaurants = Restaurant.all.alphabetical_order.page(params[:page]) #show ALL restaurants
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @restaurant}
    end

    @reviews = @restaurant.reviews
    @cuisines = @restaurant.cuisines
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

end
