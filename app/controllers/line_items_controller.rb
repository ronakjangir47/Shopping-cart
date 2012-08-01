class LineItemsController < ApplicationController

	def create
		@cart = current_cart
		product = Product.find(params[:product_id])
		@line_item = @cart.add_product(product.id)

		respond_to do |format|
			if @line_item.save
				session[:counter] = 0
				format.html { redirect_to cart_path(@cart) }
			else
				format.html { redirect_to root_path,
					notice: @line_item.errors }
	  	end		
	end
	
end
