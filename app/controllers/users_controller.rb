class UsersController < ApplicationController
  before_action :set_user, only: [:show, :followers, :followings, :your_joined_discussions]

  def show
    get_user_rooms
    get_owners
    @rooms = Room.where(id:@owners.pluck(:room_id))
  end

  def followings
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  def your_joined_discussions
    user_rooms = UserRoom.where(user_id: @user.id)
    @rooms = Room.where(id:user_rooms.pluck(:room_id))
    get_user_rooms
    render 'show'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def get_owners
    @owners = Owner.where(owner_id: @user.id)
  end
end
