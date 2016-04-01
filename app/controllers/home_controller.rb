class HomeController < ApplicationController
  def index
    @logo = Product.find(348).image2
  end
end
