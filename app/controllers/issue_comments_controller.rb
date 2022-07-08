class IssueCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_issue_comments, only: [:edit,:update,:destroy]
  before_action :find_issue_for_issue_comment, only: [:destroy,:edit,:update]

  def create
    @issue_comment = IssueComment.new
    @issue = Issue.find(params[:issue_id])
    if find_user_positioin_in_issue != nil
      if IssueComment.create(issue_comment_params)
        redirect_to room_issue_path(@issue.room_id,@issue)
      else
        create_issue_comments
        find_room_and_issues
        render 'issues/show'
      end
    else
      create_issue_comments
      find_room_and_issues
      render 'issues/show'
    end
  end
  
  def edit
    @issue_comments = @issue.issue_comments.includes(:user)
    find_user_positioin_in_issue
    find_room_and_issues
    render 'issues/show'
  end

  def update
    if find_user_positioin_in_issue != nil
      if @issue_comment.update(issue_comment_params)
        redirect_to room_issue_path(@issue.room_id,@issue)
      else
        find_room_and_issues
        render 'issues/show'
      end
    else
      find_room_and_issues
      render 'issues/show'
    end
  end

  def destroy
    if @issue_comment.user == current_user && @issue_comment.issue_id == params[:issue_id].to_i
      @issue_comment.destroy
    end
    redirect_to room_issue_path(@issue.room_id,@issue)
  end

  private
  def issue_comment_params
    params.require(:issue_comment).permit(:text).merge(user_id:current_user.id, issue_id:params[:issue_id],standing_position_id:@position.standing_position_id)
  end

  def create_issue_comments
    @issue_comments = @issue.issue_comments.includes(:user)
  end
  
  def find_issue_comments
    @issue_comment = IssueComment.find(params[:id])
  end

  def find_issue_for_issue_comment
    @issue = Issue.find(params[:issue_id])
  end

  def find_user_positioin_in_issue
    @user_room = UserRoom.find_by(user_id:current_user.id,room_id:@issue.room_id)
    if user_signed_in? && @user_room.present?
      @position = @user_room.position
    end
  end

  def find_room_and_issues
    @room = Room.find(@issue.room_id)
    @issues = Issue.where(room_id: @issue.room_id)
  end
end
