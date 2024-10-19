class FeedsController < ApplicationController
  before_action :set_current_user

  def index
    following = Follower.where(from: current_user).pluck(:id)
    blocked_users = BlockedUsers.where(for_user_id: current_user.id).pluck(:id)
    allowed_users = following - blocked_users

    Posts.where(user_id: allowed_users)
  end
end
