class Api::PostsController < Api::ApplicationController
  before_action :set_user

  def index
    posts = Post.where(author_id: @user.id)
    render json: posts, status: :ok
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
