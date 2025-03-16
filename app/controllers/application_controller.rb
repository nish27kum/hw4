class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    @current_user ||= User.find_by(id: session["user_id"]) if session["user_id"]
  end


  def require_login
    if @current_user.nil?
      flash["notice"] = "You must be logged in to access this page!"
      redirect_to "/login"
    end
  end
  
end