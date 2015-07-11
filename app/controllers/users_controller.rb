class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    # @categories = Category.order(created_at: :desc)
    @categories = Category.order(updated_at: :desc).paginate(:page => params[:page], :per_page => 6)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      flash[:notice]="Person was updated successfully!"
      redirect_to(users_path)
    else
      flash[:error]="Person was not updated."
      render :edit
    end
  end

  def create
    
  end

  def show
    @user = User.find_by(id: params[:id])
    # @categories = Category.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end

end
