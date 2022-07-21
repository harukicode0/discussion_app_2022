class IssuesController < ApplicationController
  before_action :authenticate_user!, except:[:show]
  before_action :count_down_timer, only: [:new,:create, :update, :destroy, :edit]

  def show
    @issue = Issue.find(params[:id])
    @room = Room.find(@issue.room_id)
    @issue_comments = @issue.issue_comments.includes(:user).order(created_at: "DESC")
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

  def edit
    @room = Room.find(params[:room_id])
    @issue = Issue.find(params[:id])
  end

  def update
    @issue = Issue.find(params[:id])
      if @issue.update(issue_params)
        redirect_to 'show'
      else
        render 'edit'
      end
  end

  def destroy
    issue = Issue.find(params[:id])
    room = issue.room
    issue.destroy
    redirect_to room_path(room) || root_path
  end
  

  private
  def issue_params
    params.require(:issue).permit(:issue_title).merge(room_id: params[:room_id],owner_id:current_user.id)
  end
end
