class IssueCommentsController < ApplicationController
  before_action :authenticate_user!
  # before_action :find_issue_comments, only: [:edit,:update,:destroy]
  # before_action :find_room_for_issue_comment, only: [:destroy]

  def create
    @issue_comment = IssueComment.new
    @issue = Issue.find(params[:issue_id])
    if find_user_positioin_in_issue != nil
      if IssueComment.create(issue_comment_params)
        redirect_to room_issue_path(@issue.room_id,@issue)
      else
        create_issue_comments
        render 'issues/show'
      end
    else
      create_issue_comments
      render 'issues/show'
    end
  end
  
  def edit
    @room = Room.find(params[:room_id])
    @issue_comments = @room.issue_comments.includes(:user)
    find_user_positioin
    @count_participants = count_participants(@room.id)
    render 'rooms/show'
  end

  def update
    @room = Room.find(params[:room_id])
    if find_user_positioin != nil
      if @issue_comment.update(issue_comment_params)
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
    if @issue_comment.user == current_user && @issue_comment.room_id == params[:room_id].to_i
      @issue_comment.destroy
    end
    redirect_to room_path(@room)
  end

  private
  def issue_comment_params
    params.require(:issue_comment).permit(:text).merge(user_id:current_user.id, issue_id:params[:issue_id],standing_position_id:@position.standing_position_id)
  end

  def create_issue_comments
    @issue_comments = @issue.issue_comments.includes(:user)
  end
  
  def find_issue_comments
    @issue_comment = Comment.find(params[:id])
  end

  def find_room_for_issue_comment
    @room = Room.find(params[:room_id])
  end

  def find_user_positioin_in_issue
    @user_room = UserRoom.find_by(user_id:current_user.id,room_id:@issue.room_id)
    if user_signed_in? && @user_room.present?
      @position = @user_room.position
    end
  end
end
