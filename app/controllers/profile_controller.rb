class ProfileController < ApplicationController
  include FollowConcern

  before_action :get_users_to_follow, only: [:index]

  def index
    @posts = Post.where(user_id: current_user).order_by(created_at: 'desc')
    @followers = current_user.all_followers
    @followees = current_user.all_followees
  end
end
