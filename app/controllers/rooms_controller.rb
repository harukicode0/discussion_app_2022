class RoomsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show, :search, :sort_following]
  before_action :get_user_rooms, only: [:index, :search, :sort_participants, :sort_comments,:sort_following]

  def index
    get_rooms
  end

  def show
    @room = Room.find(params[:id])
    @comments = @room.comments.includes(:user)
    @comment = Comment.new
    find_user_positioin
    @count_participants = count_participants(@room.id)
    @issues = Issue.where(room_id: params[:id])
  end

  def new
    @room_tag_user_form = RoomTagUserForm.new
  end

  def create
    @room_tag_user_form = RoomTagUserForm.new(room_other_params)
    if @room_tag_user_form.valid?
      @room_tag_user_form.save
      redirect_to room_path(@room_tag_user_form.room_id)
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

  def search
    @rooms = Room.search(params[:keyword]).order(created_at: "DESC").page(params[:page]).per(25)
    render 'index'
  end

  def tag_search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  def sort_participants
    #ルームへの参加者が多い順
    @rooms = Room.joins(:user_rooms).group(:room_id).order('count(user_id) desc').page(params[:page]).per(25)
    render 'index'
  end

  def sort_comments
    @rooms = Room.joins(:comments).group(:room_id).order('count(text) desc').page(params[:page]).per(25)
    render 'index'
  end

  def sort_following
    @user = User.find(params[:id])
    @users = @user.followings
    if @users.exists?
      #ふぉろわーのIDを条件に、ルームを取得
      @rooms = Room.joins(:user_rooms).where(user_rooms:{user_id:@users.ids}).page(params[:page]).per(25)
      render 'index'
    else
      flash[:following] = "あなたは誰もフォローしていません。ルーム一覧ページに戻りました"
      get_rooms
      render 'index'
    end
  end

  private

  def room_other_params
    params.require(:room_tag_user_form).permit(:title,:tag_name).merge(deadline: Time.now + 3.days, user_id: current_user.id)
  end

  def create_new_position
    @position = Position.create(user_room_id: @user_room.id, standing_position_id:params[:standing_position])
  end
end
