class EntriesController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = @current_user
  
    if @entry.save
      flash["notice"] = "Congrats, new entry created successfully!"
      redirect_to @entry.place
    else
      flash["alert"] = "Failed to create entry, Please check your details!"
      render "new"
    end
  end
  
  private
  
  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :place_id, :image)
  end


  def require_login
    unless @current_user
      flash["alert"] = "You must be logged in to create an entry."
      redirect_to "/login"
    end
  end
end
