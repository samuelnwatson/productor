class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user.name

    if @product.save
      flash[:notice] = "product created"
      redirect_to @product
    else
      flash[:alert] = "product could not be created"
      render 'new'
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "product updated"
      redirect_to @product
    else
      flash[:alert] = "product could not be updated"
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    flash[:alert] = "product destroyed"
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :user, category_ids: [])
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
