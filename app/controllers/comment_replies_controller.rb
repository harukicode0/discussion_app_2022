class CommentRepliesController < ApplicationController
   def create
    
    binding.pry
    
    @comment_reply = CommentReply.new(params[:object])
    if @comment_reply.save
      redirect_to 'comment/show'
    else
      @comment = Comment.find(params[:comment_id])
      @room = @comment.room
      render 'comments/show'
    end
  end

  def edit
    # @ = .find()
  end

  def update
    @object = Object.find(params[:id])
      if @object.update_attributes(params[:object])
        flash[:success] = "Object was successfully updated"
        redirect_to @object
      else
        flash[:error] = "Something went wrong"
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
end
