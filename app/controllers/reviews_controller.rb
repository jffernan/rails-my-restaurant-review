class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show, :top_reviews]

  def index
    if params[:rating]
      @reviews = Review.where(:rating => params[:rating]).order_by_date
    else
      @reviews = Review.all.order_by_date #call AR method to order by most recent date
    end
  end

  def show
  end

  def new
    @review = Review.new
    #@cuisines = @review.cuisines.build
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
    redirect_to '/', notice: "Review deleted!"
  end

  private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params #strong params tell which attrs permitted into controller actions SECURES against bad data
    #params.require(:review).permit(:restaurant_name, :content, cuisine_ids:[], cuisines_attributes: [:name], :rating, :review_date)
    params.require(:review).permit(:restaurant_name, :content, :rating, :date_visited, :cuisine_ids => [], :cuisines_attributes => [:name])
  end

end
