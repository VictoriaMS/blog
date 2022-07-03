class PostsController < ApplicationController
  def new 
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = User.first
    if @post.save
      redirect_to @post
    else
      render new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def post_params 
    params.require(:post).permit(:header, :body)
  end
end
