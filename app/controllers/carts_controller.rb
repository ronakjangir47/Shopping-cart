class CartsController < ApplicationController
	skip_before_filter :authorize, :only => [:create, :update, :destroy]

	def show
		@cart = current_cart
		@line_items = @cart.line_items.includes(:product).all
	end

	def destroy
		current_cart.line_items.delete_all
		@cart = current_cart
		respond_to do |format|
			format.html{redirect_to cart_path(current_cart), notice: 'Your Cart is Currently Empty!'}
			format.js 
		end
	end

end
