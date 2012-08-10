class ApplicationController < ActionController::Base

  before_filter :authorize
  protect_from_forgery

  def destroy_cart_item product_id
   current_item = current_cart.line_items.find(product_id)
    if current_item.quantity == 1
      current_item.destroy
    else
      current_item.quantity -= 1
      current_item.save
    end
  end

  private
  
  def current_cart
  	Cart.find(session[:cart_id])
  	rescue ActiveRecord::RecordNotFound
  		cart = Cart.create
  		session[:cart_id] = cart.id
  		cart
  end	

  protected 

    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_path, alert: "Please Login!"
      end
    end
  
end
