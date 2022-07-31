class CommentRepliesController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.find(params[:comment_id])
    @room = @comment.room
    @comment_reply = CommentReply.new(comment_reply_params)
    if @comment_reply.save
      redirect_to room_comment_path(@room,@comment)
    else
      @comment_replyies = CommentReply.where(comment_id: @comment.id)
      render 'comments/show'
    end
  end

  def edit
    @comment = Comment.find(params[:comment_id])
    @room = @comment.room
    @comment_replies = CommentReply.where(comment_id: @comment.id).includes(:user)
    @comment_reply = CommentReply.find(params[:id])
    render 'comments/show'
  end

  def update
    @comment_reply = CommentReply.find(params[:id])
    @comment = Comment.find(params[:comment_id])
    @room = @comment.room
    if @comment_reply.update(comment_reply_params)
      redirect_to room_comment_path(@room,@comment)
    else
      @comment_replies = CommentReply.where(comment_id: @comment.id).includes(:user)
      render 'comments/show'
    end
  end
  
  def destroy
    @object = Object.find(params[:id])
    if @object.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to objects_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to objects_url
    end
  end

  private

  def comment_reply_params
    params.require(:comment_reply).permit(:text).merge(user_id: current_user.id, comment_id: params[:comment_id])
  end
end
