class CategoriesController < ApplicationController
before_action :find_category, only: [:edit, :update, :destroy, :show]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      flash[:notice]="Category created!"
      redirect_to(category_path(@category.id))
    else
      flash[:error]="Category failed to create!"
      render :new
    end
  end

  def edit   
  end

  def update
    if @category.update(category_params)
      flash[:notice]="Category updated!"
      redirect_to(category_path(@category.id))
    else
      flash[:error]="Category failed to update, for shame!"
      render :edit
    end
  end

  def show
    
  end

  def destroy
    @category.destroy
    redirect_to(categories_path)
  end

  private

  def find_category
    @category = Category.find_by(id: params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :cat_pic)
  end
end
