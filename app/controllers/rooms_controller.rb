class RoomsController < ApplicationController
  def index
    @room = Room.all
  end

  def show
    
  end

  def new
    @room = Room.new
  end
  
  def create
    @object = Object.new(params[:object])
    if @object.save
      flash[:success] = "Object successfully created"
      redirect_to @object
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  

end
