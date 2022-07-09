class IssuesController < ApplicationController
  before_action :authenticate_user!, except:[:show]

  def show
    @issue = Issue.find(params[:id])
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
      redirect_to room_issue_path(params[:room_id],@issue)
    else
      @room = Room.find(params[:room_id])
      render 'new'
    end
  end

  private
  def issue_params
    params.require(:issue).permit(:issue_title).merge(room_id: params[:room_id],owner_id:current_user.id)
  end
end
