class PlacesController < ApplicationController
  before_action :require_login

  def index
    @places = Place.where(user_id: session[:user_id])
  end

  def show
    @place = Place.find(params[:id])
    @entries = @place.entries.where(user_id: session[:user_id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(name: params[:name])
    @place.user_id = session[:user_id] 

    if @place.save
      redirect_to "/places"
    else
      render :new
    end
  end

  private

  def require_login
    redirect_to "/login" unless session[:user_id]
  end
  
end