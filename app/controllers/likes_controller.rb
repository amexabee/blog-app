class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.build(post: @post)

    if @like.save
      redirect_to user_post_path(@post.author, @post)
    else
      render :new
    end
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
