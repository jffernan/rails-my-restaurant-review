class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  include ApplicationHelper

  def home
  end

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

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Signup successful!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User successfully updated!"
    else
      render :edit
    end
  end

  def destroy
      @user.destroy
      redirect_to '/', notice: "User successfully deleted!"
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation)
    end

end
