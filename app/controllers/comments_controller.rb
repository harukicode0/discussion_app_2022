class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = Comment.new
    @room = Room.find(params[:room_id])
    if find_user_positioin != nil
      if Comment.create(comment_params)
        redirect_to room_path(@room)
      else
        create_comments
        render 'rooms/show'
      end
    else
      create_comments
      render 'rooms/show'
    end
  end
  

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id:current_user.id, room_id:params[:room_id],standing_position_id:@position.standing_position_id)
  end
end
