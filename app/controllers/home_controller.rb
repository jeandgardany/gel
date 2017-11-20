class HomeController < ApplicationController
  def index
  	if params[:search]
  		@products = Product.where(name: params[:search])
  	else
  		@products = Product.all
  	end
  end
end
