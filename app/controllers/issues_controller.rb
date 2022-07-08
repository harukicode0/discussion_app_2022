class IssuesController < ApplicationController
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
    params.require(:issue).permit(:issue_title).merge(room_id: params[:room_id])
  end
end
