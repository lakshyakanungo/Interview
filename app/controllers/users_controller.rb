class UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save!
      render json: { message: "Success", user_id: user.id }
    else
      render json: { error: "User creation failed" }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
