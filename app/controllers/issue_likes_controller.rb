class IssueLikesController < ApplicationController
  before_action :authenticate_user!
  before_action :count_down_timer

  def create
    issuelike = IssueLike.new(user_id: current_user.id, issue_comment_id:params[:issue_comment_id])
    issuelike.save
    @issue = Issue.find(params[:issue_id])
    redirect_to room_issue_path(@issue.room_id,@issue)
  end

  def destroy
    issuelike = IssueLike.find_by(user_id: current_user.id, issue_comment_id: params[:issue_comment_id])
    issuelike.destroy
    @issue = Issue.find(params[:issue_id])
    redirect_to room_issue_path(@issue.room_id,@issue)
  end
end
