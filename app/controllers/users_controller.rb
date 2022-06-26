class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @rooms = Room.all.order(id: "DESC")
  end

  def set_user
    @user = User.find(params[:id])
  end
end
