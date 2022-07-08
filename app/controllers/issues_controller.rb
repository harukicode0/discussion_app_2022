class IssuesController < ApplicationController
  def show
    @issue = Issue.find(params[:room_id])
    @room = Room.find(@issue.room_id)
    @issue_comments = @issue.issue_comments.includes(:user)
    @issue_comment = IssueComment.new
    get_user_rooms
    find_user_positioin_in_issue
    @issues = Issue.where(room_id: @issue.room_id)
  end
  
  def new
    @issue = Issue.new
    @room = Room.find(params[:room_id])
  end
  
  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      redirect_to room_path(params[:room_id])
    else
      @room = Room.find(params[:room_id])
      render 'new'
    end
  end

  private
  def issue_params
    params.require(:issue).permit(:issue_title).merge(room_id: params[:room_id],owner_id:current_user.id)
  end

  def find_user_positioin_in_issue
    @user_room = UserRoom.find_by(user_id:current_user.id,room_id:@issue.room_id)
    if user_signed_in? && @user_room.present?
      @position = @user_room.position
    end
  end
end
