class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    
    # binding.pry
    @user = User.find(params[:id])
    @rooms = Room.includes(:owner).order(created_at: "DESC")
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
