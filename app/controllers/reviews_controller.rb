class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  def index
    @users = User.all.alphabetical_order
    if params[:user]
      @reviews = Review.by_user(params[:user]) #Filter to search reviews by user
    elsif params[:rating]
      @reviews = Review.by_rating(params[:rating]).order_by_date_visited
    else
      @reviews = Review.all.order_by_date_visited #call AR method to order by most recent visit date
    end
  end

  def show
    @current_restaurant ||= Restaurant.find_by(id: @review[:restaurant_id])
    @review.restaurant_id = @current_restaurant.id
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to @review, success: "New review created!"
    else
      flash.now[:alert] = "Save Review unsuccesful! Please try again!"
      render 'new'
    end
  end

  def update
    if @review.update(review_params) #update a record that already exists, accepts hash containing attributes
      redirect_to @review, notice: "Review updated!"
    else
      flash.now[:alert] = "Review Update unsuccesful! Please try again!"
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    @review.destroy
    redirect_to user_path(current_user), notice: "Review deleted!"
  end

  private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params #strong params tell which attrs permitted into controller actions SECURES against bad data
    params.require(:review).permit(:restaurant_name, :content, :rating, :date_visited, :cuisine_ids => [], :cuisines_attributes => [:name]) #ALT: cuisine_ids:[], cuisines_attributes: [:name]
  end

end
