class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @room = Room.find(params[:room_id])
    if @comment.save
      redirect_to room_path(@room)
    else
      render room_path
    end
  end
  

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id:current_user.id, room_id:params[:room_id])
  end
end
