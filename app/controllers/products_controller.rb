class ProductsController < ApplicationController

  def index
    @products = Product.all


    @products = @products.brand(params[:brand]) if params[:brand].present?

  end


  def show
    @products = Product.all
    @product = Product.find(params[:id])
  end



end
