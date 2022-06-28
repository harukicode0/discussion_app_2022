class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :get_rooms, only: [:show]

  def show
    get_user_rooms
    get_participant_number
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
