class IssueRepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :prepara_comment_and_room_for_issue_reply, only: [:edit, :update, :destroy, :create]
  before_action :count_down_timer

  def create
    @issue_reply = IssueReply.new(issue_reply_params)
    if @issue_reply.save
      redirect_to room_issue_issue_comment_path(@room,@issue,@issue_comment)
    else
      @_replyies = IssueReply.where(issue_comment_id: @issue.id)
      render 'issue_comments/show'
    end
  end

  def edit
    @issue_replies = IssueReply.where(issue_comment_id: @issue_comment.id).includes(:user)
    @issue_reply = IssueReply.find(params[:id])
    render 'issue_comments/show'
  end

  def update
    @issue_reply = IssueReply.find(params[:id])
    if @issue_reply.update(issue_reply_params)
      redirect_to room_issue_issue_comment_path(@room,@issue,@issue_comment)
    else
      @issue_replies = IssueReply.where(issue_comment_id: @issue_comment.id).includes(:user)
      render 'issue_comments/show'
    end
  end
  
  def destroy
    @comment_reply = CommentReply.find(params[:id])
    @comment_reply.destroy
    redirect_to room_comment_path(@room,@comment)
  end

  private

  def issue_reply_params
    params.require(:issue_reply).permit(:text).merge(user_id: current_user.id, issue_comment_id: params[:issue_comment_id])
  end

  def prepara_comment_and_room_for_issue_reply
    @issue_comment = IssueComment.find(params[:issue_comment_id])
    @issue = @issue_comment.issue
    @room = @issue.room
  end
end
