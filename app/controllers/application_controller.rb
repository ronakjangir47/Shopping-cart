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


  def destroy_cart_item product_id
   current_item = current_cart.line_items.find(product_id)
    if current_item.quantity == 1
      current_item.destroy
    else
      current_item.quantity -= 1
      current_item.save
    end

  end
end
