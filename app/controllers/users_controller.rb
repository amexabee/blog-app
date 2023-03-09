class UsersController < ApplicationController
  before_action :authenticate_user!
  layout 'standard'
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
