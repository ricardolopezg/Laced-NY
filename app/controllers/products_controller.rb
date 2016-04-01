class ProductsController < ApplicationController

  def index
    @products = Product.all


    @products = @products.brand(params[:brand]) if params[:brand].present?

  end




end
