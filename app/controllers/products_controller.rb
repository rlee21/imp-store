class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def search
    @results = Product.where("lower(name) LIKE ?", "%#{params[:search].downcase}%")
  end
end
