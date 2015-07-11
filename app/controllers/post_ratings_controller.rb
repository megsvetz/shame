class PostRatingsController < ApplicationController
before_action :find_post
before_action :authenticate_user!
  def good
    @post_good = @post.post_ratings.create(like: true, user: current_user)
    redirect_to(category_path(@post.category_id))
  end

  def bad
    @post_bad = @post.post_ratings.create(like: false, user: current_user)
    redirect_to(category_path(@post.category_id))
  end

  def update
    if(@post_update == @post_bad || @post_update == @post_good)
      flash[:alert]="You can only vote once!"
    elsif(@post_update != @post_bad)
      @post_update = @post_good
    else
      @post_update = @post_bad
    end
  end

  private

  def find_post
    @post = Post.find_by(id: params[:post_id])
    unless @post
      render(text: "Post not found.", status: :not_found)
    end
  end
end
