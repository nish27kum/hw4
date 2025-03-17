class EntriesController < ApplicationController
  before_action :require_login

  def new
    @place = Place.find(params[:place_id])
    @entry = Entry.new
  end

  def create
    @place = Place.find(params[:place_id])  
    @entry = @place.entries.new(entry_params)  
    @entry.user_id = session[:user_id]  

    if @entry.save
      redirect_to "/places/#{@entry.place_id}"
    else
      render "new"
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :image)  
  end

  def require_login
    redirect_to "/login" unless session[:user_id]
  end
end