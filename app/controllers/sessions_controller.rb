class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash["notice"] = "Welcome, #{user.name}, You are now logged in!"
      redirect_to "/places"
    else
      redirect_to "/login", alert: "Invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    flash["notice"] = "You have been logged out successfully!"
    redirect_to "/login"
  end
end