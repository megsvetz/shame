class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user! 
 
  def index
    @posts = Post.all
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.build(post_params)
    if @post.save
      flash[:notice]="Post was created succesfully!"
      redirect_to posts_path
    else
      flash[:error]="Post was not created."
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice]="Post was updated successfully!"
      redirect_to posts_path
    else
      flash[:error]="Post was not updated."
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:alert]="Post was successfully deleted!"
    end
    redirect_to(category_posts_path)
  end

private
  def post_params
    params.require(:post).permit(:name, :description, :category_id, :rating, :post_pic, :user_id)
  end

  def find_post
    @post = Post.find_by(id: params[:id])
    unless @post
      render(text: "Post not found.", status: :not_found)
    end
  end

  def find_category
    @category = Category.find(params[:category_id])
  end
end
