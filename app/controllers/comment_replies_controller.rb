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
    # @ = .find()
  end

  def update
    @object = Object.find(params[:id])
      if @object.update_attributes(params[:object])
        redirect_to @object
      else
        render 'edit'
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
