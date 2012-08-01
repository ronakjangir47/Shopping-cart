class LineItemsController < ApplicationController

	def create
		@cart = current_cart
		product = Product.find(params[:product_id])
		@line_item = @cart.add_product(product.id)

		respond_to do |format|
			if @line_item.save
				session[:counter] = 0
				format.html { redirect_to cart_path(@cart),
					notice: "List Item was successfully Created." }
			else
				format.html { redirect_to root_path,
					notice: @line_item.errors }
	  	end		
	  	
	end
		rescue ActiveRecord::RecordNotUnique
				redirect_to cart_path(@cart), notice: "Item Already Exist"
			end
end
