class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :count_down_timer

  def create
    like = Like.new(user_id: current_user.id,comment_id:params[:comment_id])
    like.save
    redirect_to room_path(params[:room_id])
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, comment_id: params[:comment_id])
    like.destroy
    redirect_to room_path(params[:room_id])
  end
end
