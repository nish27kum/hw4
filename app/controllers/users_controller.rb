class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      flash[:notice] = "Yayy, account created successfully!!"
      redirect_to "/"
    else
      flash[:alert] = @user.errors.full_messages.join(", ") 
      redirect_to "/users/new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end