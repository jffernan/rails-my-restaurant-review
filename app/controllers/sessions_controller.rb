class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    if auth_hash = request.env['omniauth.auth'] #login via OmniAuth
      user = User.find_or_create_by_omniauth(auth_hash)
      log_in user
      redirect_to user, notice: "Login successful!"

    else #standard login
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to user, notice: "Login successful!"
      else
        flash.now[:alert] = "Login unsuccesful! Please try again or signup!" #flash.now works w/ render
        render :new #Render is NOT request
      end
    end
  end

  def destroy
    log_out
    redirect_to login_path, notice: "Log out successful!"
  end
end
