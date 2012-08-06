class LineItemsController < ApplicationController

	def create
		@cart = current_cart
		product = Product.find(params[:product_id])
		@line_item = @cart.add_product(product.id)

		respond_to do |format|
			if @line_item.save
				session[:counter] = 0
				format.html { redirect_to root_path }
				format.js { @current_item = @line_item }
			else
				format.html { redirect_to root_path,
					notice: @line_item.errors }
	  	end		
	  end
	end

	def destroy
		destroy_cart_item params[:id]
		@cart = current_cart
		respond_to do |format|
		  format.html {redirect_to cart_path(current_cart), notice: 'Item is removed from Cart!'}
		  format.js
		end
	end
end
