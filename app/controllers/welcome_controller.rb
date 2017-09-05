class WelcomeController < ApplicationController
  include FollowConcern
  
  before_action :get_users_to_follow, only: [:index]

  def index
    followee_ids = current_user.all_followees.pluck(:_id)
    @posts = Post.where(:user_id.in => followee_ids).order_by(created_at: 'desc')
    @post = Post.new
  end
end
