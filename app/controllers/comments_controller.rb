class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  before_action :set_comment, only: [:destroy, :update]

  def destroy
    @post = @comment.post
    @comment.destroy
    redirect_to post_path(@post)
  end
  
  def create 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(user: current_user))
    redirect_to post_path(@comment.post)
  end

  def update 
    @comment.update(comment_params)
    redirect_to post_path(@comment.post)
  end

  private 

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params 
    params.require(:comment).permit(:body)
  end
end
