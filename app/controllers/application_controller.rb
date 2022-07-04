class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :basic_auth

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :sex_id, :birthday])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :sex_id, :birthday, :profile])
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
    @rooms = Room.includes(:owner).order(created_at: "DESC")
  end

  def create_comments
    @comments = @room.comments.includes(:user)
  end

  def find_user_positioin
    @user_room = UserRoom.find_by(user_id:current_user.id,room_id:@room.id)
    if user_signed_in? && @user_room.present?
      @position = @user_room.position
    end
  end

  def count_participants(id)
    UserRoom.where(room_id:id).count
  end
end
