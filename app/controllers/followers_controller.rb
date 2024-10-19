class FollowersController < ApplicationController
  def follow
    follow = Follower.save(follower_params)

    if follow.save!
      render json: { message: "Success", follower_id: follow.id }
    else
      render json: { error: "Follow failed" }
    end
  end

  def unfollow
    follower  = Follow.find(follower_params)

    if follower.delete
      render json: { message: "Success", follower_id: unfollow.id }
    else
      render json: { error: "Unfollow failed" }
    end
  end

  private

  def follower_params
    params.require(:follower).permit(:from_id, :to_id)
  end
end
