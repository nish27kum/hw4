class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params["email"])
    
    if user && user.authenticate(params["password"])
      session["user_id"] = user.id
      flash["notice"] = "Welcome, #{user.username}!"
      redirect_to "/places"
    else
      flash["notice"] = "Invalid email or password. Please try again."
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "You have successfully logged out."
    redirect_to "/login"
  end
end