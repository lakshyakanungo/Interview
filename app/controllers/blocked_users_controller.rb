class BlockedUsersController < ApplicationController
  def create
    blocked_user = BlockedUser.new(blocked_user_params)

    if blocked_user.save
      render json: { message: "Successfully blocked", blocked_user_id: blocked_user.id }
    else
      render json: { error: "Failed" }
    end
  end

  private

  def blocked_user_params
    params.require(:blocked).permit(:for_user_id, :blocked_user_id_id)
  end
end
