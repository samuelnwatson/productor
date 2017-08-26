class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(Category_params)

    if @category.save
      flash[:notice] = "category created"
      redirect_to @category
    else
      flash[:alert] = "category could not be created"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "category updated"
      redirect_to @category
    else
      flash[:alert] = "category could not be updated"
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:alert] = "category destroyed"
    redirect_to root_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = category.find(params[:id])
  end
end
