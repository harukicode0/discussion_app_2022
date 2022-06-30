class UsersController < ApplicationController
  before_action :set_user, only: [:show, :followers, :followings]
  before_action :get_rooms, only: [:show]

  def show
    get_user_rooms
    @users = User.where.not(id: current_user.id)
  end

  def update
    binding.pry
    redirect_to user_path(current_user)
  end

  def followings
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
