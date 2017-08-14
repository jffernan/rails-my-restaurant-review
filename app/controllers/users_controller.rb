class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:home, :new, :create]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def home
  end

  def index
    @users = User.all.alphabetical_order #show all users in alphabetical order
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user, success: "Signup successful!" #Temporary flash message after redirect
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
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

    def correct_user #confirms correct user to edit/update
      @user = User.find(params[:id])
      redirect_to user_path(current_user),
      alert: "Sorry NO access to that page!" unless current_user?(@user)
    end

end
