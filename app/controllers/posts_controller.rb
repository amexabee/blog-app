class PostsController < ApplicationController
  def index
    @posts = Post.includes(:author).where(author_id: params[:user_id])
  end

  def show
    @post = Post.includes(:author).find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
