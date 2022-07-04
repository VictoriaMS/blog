class PostsController < ApplicationController
  load_and_authorize_resource
  
  def index 
    @posts = Post.all
  end

  def new 
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post
    else
      render new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
  end

  private

  def post_params 
    params.require(:post).permit(:header, :body)
  end
end
