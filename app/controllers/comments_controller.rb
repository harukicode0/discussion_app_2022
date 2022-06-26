class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @room = Room.find(params[:room_id])
    if find_user_positioin
      comment = Comment.new(comment_params)
      
      if comment.save
        redirect_to room_path(@room)
      else
        @comment = Comment.new
        @comments = @room.comments.includes(:user)
        render 'rooms/show'
      end
    else
      @comment = Comment.new
      @comments = @room.comments.includes(:user)
      render 'rooms/show'
    end
  end
  

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id:current_user.id, room_id:params[:room_id],standing_position_id:@position.standing_position_id)
  end

  def find_user_positioin
    if @user_room = UserRoom.find_by(user_id:current_user.id,room_id:@room.id)
      @position = @user_room.position
    end
  end
end
