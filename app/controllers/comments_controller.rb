class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comments, only: [:edit,:update,:destroy]
  before_action :find_room_for_comment, only: [:destroy]
  before_action :count_down_timer, only: [:create,:edit,:update,:destroy]

  def create
    
    binding.pry
    
    @comment = Comment.new
    @room = Room.find(params[:room_id])
    if find_user_positioin != nil
      comment = Comment.create(comment_params)
      if comment.present?
        render json:{ comment: comment }
      else
        create_comments
        @issues = Issue.where(room_id: @room.id)
        render 'rooms/show'
      end
    else
      create_comments
      @issues = Issue.where(room_id: @room.id)
      render 'rooms/show'
    end
  end
  
  def edit
    @room = Room.find(params[:room_id])
    @comments = @room.comments.includes(:user)
    find_user_positioin
    @count_participants = count_participants(@room.id)
    @issues = Issue.where(room_id: @room.id)
    render 'rooms/show'
  end

  def update
    @room = Room.find(params[:room_id])
    if find_user_positioin != nil
      if @comment.update(comment_params)
        redirect_to room_path(@room)
      else
        render 'rooms/show'
      end
    else
      render 'rooms/show'
    end
  end

  def destroy
    @room = Room.find(params[:room_id])
    if @comment.user == current_user && @comment.room_id == params[:room_id].to_i
      @comment.destroy
    end
    redirect_to room_path(@room)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id:current_user.id, room_id:params[:room_id],standing_position_id:@position.standing_position_id)
  end
  
  def find_comments
    @comment = Comment.find(params[:id])
  end

  def find_room_for_comment
    @room = Room.find(params[:room_id])
  end
end
