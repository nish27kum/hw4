class UsersController < ApplicationController
  def new
    @user = User.new  
  end

  def create
    @user = User.new(user_params)  

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, #{@user.name}! Your account has been created successfully!"
      redirect_to "/places"
    else
      flash[:alert] = "Signup failed! Please check your details."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end