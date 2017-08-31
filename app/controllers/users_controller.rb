class UsersController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow]

  def follow
    current_user.follow(@user)
    redirect_to :back
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_to :back
  end

private
  def set_user
    @user = User.find(id: params[:id])
  end
end
