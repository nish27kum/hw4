class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params["email"])
    if @user && @user.authenticate(params["password"])
      session["user_id"] = user.id
      flash["notice"] = "Welcome, #{user.username}! Yayy, you are now logged in successfully!"
      redirect_to "/places"
    else
      flash["alert"] = "Oops, Invalid email or password!!"
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye, You have logged out successfully!"
    redirect_to "/login"
  end
end

