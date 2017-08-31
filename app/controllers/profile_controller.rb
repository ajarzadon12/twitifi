class ProfileController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user).order_by(created_at: 'desc')
    @followers = current_user.all_followers
    @followees = current_user.all_followees
  end
end
