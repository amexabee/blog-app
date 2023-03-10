class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(post: @post)
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params.merge(post: @post))

    if @comment.save
      redirect_to user_post_path(@post.author, @post)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    post = @comment.post
    @comment.destroy
    post.decrement!(:comments_counter)
    redirect_to user_post_path(post.author, post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
