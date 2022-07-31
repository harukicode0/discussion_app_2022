class CommentRepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :prepara_comment_and_room_for_reply, only: [:edit, :update, :destroy, :create]

  def create
    @comment_reply = CommentReply.new(comment_reply_params)
    if @comment_reply.save
      redirect_to room_comment_path(@room,@comment)
    else
      @comment_replyies = CommentReply.where(comment_id: @comment.id)
      render 'comments/show'
    end
  end

  def edit
    @comment_replies = CommentReply.where(comment_id: @comment.id).includes(:user)
    @comment_reply = CommentReply.find(params[:id])
    render 'comments/show'
  end

  def update
    @comment_reply = CommentReply.find(params[:id])
    if @comment_reply.update(comment_reply_params)
      redirect_to room_comment_path(@room,@comment)
    else
      @comment_replies = CommentReply.where(comment_id: @comment.id).includes(:user)
      render 'comments/show'
    end
  end
  
  def destroy
    @comment_reply = CommentReply.find(params[:id])
    @comment_reply.destroy
    redirect_to room_comment_path(@room,@comment)
  end

  private

  def comment_reply_params
    params.require(:comment_reply).permit(:text).merge(user_id: current_user.id, comment_id: params[:comment_id])
  end

  def prepara_comment_and_room_for_reply
    @comment = Comment.find(params[:comment_id])
    @room = @comment.room
  end
end
