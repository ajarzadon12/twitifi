class ProfileController < ApplicationController
  include FollowConcern

  before_action :get_users_to_follow, only: [:index]

  def index
    params_user = User.where(username: params[:username]).first
    @user = params[:username].presence && params_user.presence ? params_user : current_user
    @posts = Post.where(user_id: @user).order_by(created_at: 'desc')
    @followers = @user.all_followers
    @followees = @user.all_followees
  end
end
