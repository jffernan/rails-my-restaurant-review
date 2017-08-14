class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  def index
    if params[:user_id] #show specific users' reviews
      @reviews = User.find(params[:user_id]).reviews.alphabetical_order
    else
      @reviews = Review.all.alphabetical_order #show ALL reviews
    end
  end

  def show
  end

  def new
    @review = Review.new
    #3.times do
      #@review.cuisines.build(:name => "New Cuisine")
    #end
  end

  def create
    @review = Review.new(review_params)  #private STRONG params bottom
    if @review.save
      redirect_to @review, success: "New review created!"
    else
      render 'new'
    end
  end

  def update
    if @review.update(review_params) #update a record that already exists, accepts hash containing attributes
      redirect_to @review, notice: "Review updated!"
    else
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    @review.destroy
    redirect_to @user_path, notice: "Review deleted!"
  end

  def top_reviews
    @reviews = Review.top_reviews.alphabetical_order #ALL excellent reviews
  end

  private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params #strong params tell which attrs permitted into controller actions SECURES against bad data
    #params.require(:review).permit(:restaurant_name, :content, cuisine_ids:[], cuisines_attributes: [:name], :rating, :review_date)
    params.require(:review).permit(:restaurant_name, :content, :rating, :review_date, cuisine_ids:[], cuisines_attributes: [:name])
  end

end
