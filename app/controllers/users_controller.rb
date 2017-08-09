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
