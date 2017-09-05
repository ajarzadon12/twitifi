class UsersController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow, :remove_follower]

  def follow
    unless current_user.follower_of? @user
      current_user.follow @user
    end
    redirect_to :back
  end

  def unfollow
    if current_user.follower_of? @user
      current_user.unfollow @user
    end
    redirect_to :back
  end
  
  def remove_follower
    if current_user.followee_of? @user
      current_user.unfollowed(@user)
    end
    redirect_to :back
  end

private
  def set_user
    @user = User.find(id: params[:id])
  end

end
