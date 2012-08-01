class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  
  def current_cart
  	Cart.find(session[:cart_id])
  	rescue ActiveRecord::RecordNotFound
  		cart = Cart.create
  		session[:cart_id] = cart.id
  		cart
  end	
    
  def destroy_cart
  	current_cart.line_items.delete_all
  end

end
