class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def set_current_user
    @current_user = User.find_by(id: params[:user_id])
  end
end
