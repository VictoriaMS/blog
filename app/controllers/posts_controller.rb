class PostsController < ApplicationController
  load_and_authorize_resource

  before_action :create_comment, only: :show
  
  def index 
    @posts = Post.paginate(page: params[:page], per_page: 7)
  end

  def new 
    respond_with(@post = Post.new)
  end

  def create
    respond_with(@post = current_user.posts.create(post_params))
  end

  def show
    respond_with(@post = Post.find(params[:id]))
  end

  private

  def post_params 
    params.require(:post).permit(:header, :body)
  end

  def create_comment 
    @comment = @post.comments.new
  end
end
