class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  include ApplicationHelper

  def index
  end

  def show
    if logged_in?
      render :show
    else
      redirect_to '/'
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "User successfully created"
    else
      redirect_to '/signup', notice: "Please try again!"
    end
  end

  def update
  end

  def destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
