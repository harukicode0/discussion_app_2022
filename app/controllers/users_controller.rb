class UsersController < ApplicationController
  before_action :set_user, only: [:show, :followers, :followings, :your_joined_discussions, :comment_issue_comment_index]
  before_action :get_user_rooms, only: [:show, :your_joined_discussions]
  
  def show
    @rooms = Room.where(owner_id:@user.id).order(created_at: "DESC").page(params[:page]).per(15)
  end

  def followings
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  def your_joined_discussions
    @rooms = Room.joins(:user_rooms).where(user_rooms:{user_id:@user.id}).where.not(owner_id:@user.id).order(created_at: "DESC").page(params[:page]).per(15)
    render 'show'
  end

  def  comment_issue_comment_index
    @comments = @user.comments.order(created_at: "DESC") + @user.issue_comments.order(created_at: "DESC")    
    render 'show'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end