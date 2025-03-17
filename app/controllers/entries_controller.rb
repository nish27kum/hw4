class EntriesController < ApplicationController
  before_action :require_login

  def new
    @place = Place.find(params[:place_id])
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(
      title: params[:title],
      description: params[:description],
      occurred_on: params[:occurred_on],
      place_id: params[:place_id],
      user_id: session[:user_id]
    )

    if @entry.save
      redirect_to "/places/#{@entry.place_id}"
    else
      render :new
    end
  end

  private

  def require_login
    redirect_to "/login" unless session[:user_id]
  end
end