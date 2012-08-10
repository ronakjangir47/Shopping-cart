class StoreController < ApplicationController
 skip_before_filter :authorize

  def index
  	if session[:counter].nil? 
  		session[:counter] = 1
  	else
  		session[:counter] += 1
  	end
  	@products = Product.paginate :page=>params[:page], :order=>'title desc',:per_page => 3
  	@cart = current_cart
  end
end
