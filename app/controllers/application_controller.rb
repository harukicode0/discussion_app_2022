class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :basic_auth

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :sex_id, :birthday, :profile, :image])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"] 
    end
  end

  def get_user_rooms
    @userrooms = UserRoom.includes(:position)
  end

  def get_participant_number
    @participants_number_hash = UserRoom.group(:room_id).count
  end

  def get_rooms
    @rooms = Room.includes(:owner).order(created_at: "DESC").page(params[:page]).per(25)
  end

  def create_comments
    @comments = @room.comments.includes(:user)
  end

  def find_user_positioin
    if user_signed_in?
      @user_room = UserRoom.find_by(user_id:current_user.id,room_id:@room.id)
      if@user_room.present?
        @position = @user_room.position
      end
    end
  end

  def find_user_positioin_in_issue
    if user_signed_in?
      @user_room = UserRoom.find_by(user_id:current_user.id,room_id:@issue.room_id)
      if user_signed_in? && @user_room.present?
        @position = @user_room.position
      end
    end
  end

  def count_participants(id)
    UserRoom.where(room_id:id).count
  end

  def count_down_timer
    @room = Room.find(params[:room_id] || params[:id])
    if @room.deadline < Time.now
      flash[:deadline] = "この議論は終了しているため、コメントの追加等の編集はできません"
      redirect_to request.referer
    end
  end
end
