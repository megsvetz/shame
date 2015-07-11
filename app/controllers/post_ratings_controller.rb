class PostRatingsController < ApplicationController
before_action :find_post
  def good
    redirect_to(category_path(@post.catergory_id)
  end

  def bad
    redirect_to(category_path(@post.catergory_id)
  end

  private

  def find_post
    @post = Post.find_by(id: params[:id])
    unless @post
      render(text: "Post not found.", status: :not_found)
    end
  end
end
