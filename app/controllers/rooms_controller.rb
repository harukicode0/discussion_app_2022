class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @comments = @room.comments.includes(:user)
    @comment = Comment.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = 'room successfully created'
      #新規作成したルームへリダイレクトしたい
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  private
  def room_params
    params.require(:room).permit(:name).merge(maker_user: current_user.nickname)
  end
end
