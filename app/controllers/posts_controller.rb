class PostsController < ApplicationController
  def create
    post = Post.new(posts_params)

    if post.save!
      render json: { message: "Success", post_id: post.id }
    else
      render json: { error: "Post creation failed" }
    end
  end

  private

  def posts_params
    params.require(:post).permit(:user_id, :title, :description)
  end
end
