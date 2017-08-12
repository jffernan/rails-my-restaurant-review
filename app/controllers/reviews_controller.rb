class ReviewsController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def index
    if params[:user_id] #show specific users' reviews
      @reviews = User.find(params[:user_id]).reviews.alphabetical_order
    else
      @reviews = Review.all.alphabetical_order #show ALL reviews
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = review.new
  end

  def create
    @review = Review.new(review_params)  #private STRONG params bottom
    if @review.save
      redirect_to @review
    else
      render 'new'
    end
  end


  def update
    @review = Review.find(params[:id])
    if @review.update(review_params) #update a record that already exists, accepts hash containing attributes
      redirect_to @review
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private
  def review_params #strong parameters tell Rails which params are permitted into our controller actions. SECURES against bad data
    params.require(:review).permit(:content, :cuisine, :rating)
  end

end
