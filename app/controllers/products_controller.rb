class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def search
    @results = Product.where("lower(name) LIKE ?", "%#{params[:search].downcase}%")
  end

  def show
  end

  def edit
  end

  def create
    @product = Product.new(user_params)
    if @product.save
      flash[:success] = "Product was successfully created"
      redirect_to @product
    else
      flash[:error] = "Product was NOT created"
      render 'new'
    end
  end

  def update
    if @product.update(product_params)
      flash[:success] = "Product was successfully updated"
      redirect_to @product
    else
      flash[:error] = "Product was NOT updated"
      render 'show'
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :image)
    end
end
