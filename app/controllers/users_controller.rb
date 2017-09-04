class Controller < ApplicationController
  before_action :set_user, only: [:follow, :unfollow]

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

private
  def set_user
    @user = User.find(id: params[:id])
  end
end
