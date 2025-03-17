class UsersController < ApplicationController
  def new
    @user = User.new 
  end

  def create
    if params[:user].present?  # Ensure `user` key exists before requiring params
      @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Welcome, #{@user.name}! Your account has been created successfully!"
        redirect_to "/places"
      else
        flash[:alert] = "Signup failed! Please check your details and try again."
        render :new
      end
    else
      flash[:alert] = "Signup failed! Missing required parameters."
      redirect_to "/signup"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end