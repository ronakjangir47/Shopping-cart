class CartsController < ApplicationController
	
	def show
		@line_items = current_cart.line_items.includes(:product).all
	end

	def destroy
		destroy_cart
		redirect_to cart_path(current_cart), notice: 'Your Cart is Currently Empty!'
	end
end
