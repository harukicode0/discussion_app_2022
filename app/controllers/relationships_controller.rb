class RelationshipsController < ApplicationController
  def create
    before_action :authenticate_user!
    following = current_user.relationships.build(follower_id: params[:user_id])
    following.save
    redirect_to request.referrer || room_path(current_user.id)
  end

  def destroy
    following = current_user.relationships.find_by(follower_id: params[:user_id])
    following.destroy
    redirect_to request.referrer || root_path(current_user.id)
  end
end
