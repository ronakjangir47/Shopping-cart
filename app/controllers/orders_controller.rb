class OrdersController < ApplicationController
	def new
		@cart = current_cart
		if @cart.line_items.empty?
			redirect_to root_path, notice: 'Your Cart is Empty!'
			return
		end

		@order = Order.new

	end

	def create
		@order = Order.new(params[:order])
		@order.add_line_items_from_cart(current_cart)
		if @order.save
			Cart.destroy(session[:cart_id])
			session[:cart_id] = nil
			redirect_to root_path, notice: 'Thank you for your Order' 
		else
			render 'new'
		end
	end

end
