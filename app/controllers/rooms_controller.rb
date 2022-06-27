class RoomsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show, :search]

  def index
    @rooms = Room.includes(:owner).order(id: "DESC")
    @participants_number_hash = UserRoom.group(:room_id).count
    @userrooms = UserRoom.includes(:position)
  end

  def search
    @rooms = Room.includes(:owner).search(params[:keyword]).order(created_at: "DESC")
    render 'index'
  end

  def show
    @room = Room.find(params[:id])
    @comments = @room.comments.includes(:user)
    @comment = Comment.new
    find_user_positioin
    @count_participants = count_participants(@room.id)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      Owner.create(name:current_user.nickname, owner_id: current_user.id,room_id:@room.id)
      redirect_to room_path(@room)
    else
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
        create_new_position
        redirect_to action: :show
      end
    else
      @user_room = UserRoom.create(room_id: @room.id, user_id: current_user.id) #中間テーブルを作成
      create_new_position  #ポジションを作成
      redirect_to action: :show
    end
  end

  private

  def room_params
    params.require(:room).permit(:name).merge(user_ids: [current_user.id])
  end

  def find_user_positioin
    if user_signed_in? && @user_room = UserRoom.find_by(user_id:current_user.id,room_id:@room.id)
      @position = @user_room.position
    end
  end

  def create_new_position
    @position = Position.create(user_room_id: @user_room.id, standing_position_id:params[:standing_position])
  end

  def count_participants(id)
    UserRoom.where(room_id:id).count
  end
end
