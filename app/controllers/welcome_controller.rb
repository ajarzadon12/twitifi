class WelcomeController < ApplicationController
  def index
    @posts = Post.where(:_id.in => current_user.all_followees).order_by(created_at: 'desc')
    followees = current_user.all_followees
    followees << current_user
    @users_to_follow = User.where(:_id.nin => followees).limit(3)
    @post = Post.new
  end
end
