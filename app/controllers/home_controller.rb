class HomeController < ApplicationController
  def index
    @products = Product.find(348).image2
  end
end
