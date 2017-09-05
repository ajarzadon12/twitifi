module FollowConcern

  extend ActiveSupport::Concern
  
  def get_users_to_follow
    followee_ids = current_user.all_followees.pluck(:_id)
    followee_ids << current_user.id

    count = User.where(:_id.nin => followee_ids).count
    if count > 3
      @users_to_follow = []
      follow_candidates = User.where(:_id.nin => followee_ids)
      while @users_to_follow.count < 3
        follow_cand = User.where(:_id.nin => followee_ids).skip(rand(count)).first
        @users_to_follow << follow_cand unless @users_to_follow.include? follow_cand
      end
      @users_to_follow
    else
      @users_to_follow = User.where(:_id.nin => followee_ids)
    end
  end
end