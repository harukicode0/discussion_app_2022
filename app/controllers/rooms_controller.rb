class RoomsController < ApplicationController
  def index
    @rooms = Room.preload(:user).order(id: "DESC").pluck
  end

  def show
    @room = Room.find(params[:id])
    @comments = @room.comments.includes(:user)
    @comment = Comment.new
    find_your_positioin
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = 'room successfully created'
      #新規作成したルームへリダイレクトしたい
      redirect_to room_path(@room)
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def standing_position
    #ルームを探す
    @room = Room.find(params[:room_id])
     #中間テーブルが存在するか否かの条件式
    if @user_room = UserRoom.find_by(room_id: @room.id, user_id: current_user.id)
      #既にポジションがある場合はアップデート、ない場合は新規作成
      if @position = Position.find_by(user_room_id:@user_room.id)
        #ポジションがある場合
        @position.update(user_room_id: @user_room.id, standing_position_id:params[:standing_position]) 
        redirect_to action: :show
      else
        #ポジションがない場合
        @position = Position.create(user_room_id: @user_room.id, standing_position_id:params[:standing_position])
        redirect_to action: :show
      end
    else
      @user_room = UserRoom.create(room_id: @room.id, user_id: current_user.id) #中間テーブルを作成
      @position = Position.create(user_room_id: @user_room.id, standing_position_id:params[:standing_position])  #ポジションを作成
      redirect_to action: :show
    end
  end

  private
  def room_params
    params.require(:room).permit(:name).merge(maker_user: current_user.nickname, user_ids: [current_user.id])
  end

  def find_your_positioin
    if @user_room = UserRoom.find_by(user_id:current_user.id,room_id:@room.id)
      @position = @user_room.position
    end
  end
end
