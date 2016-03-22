class ProductsController < ApplicationController

	def index
		@band = current_user.bands.find_by id: params[:band_id]
		@products = @band.products.all
		@product = @band.products.new
	end

	def create
		band = current_user.bands.find_by id: params[:band_id]
		@product = band.products.new product_params
		if @product.save
			flash[:"is-success"] = "Rock on!You have created a new product"
			redirect_to :back
		else
			@errors = @product.errors.full_messages
			flash[:"is-alert"] = "Oops!Something went wrong..."
			render 'new'
		end
	end

	def destroy
		band = current_user.bands.find_by id: params[:band_id]
		@product = band.products.find_by id: params[:id]
		if @product.destroy
			flash[:"is-success"] = "Product deleted"
		else
			@errors = @product.errors.full_messages
			flash[:"is-alert"] = "Oops!Something went wrong..."
		end
		redirect_to :back
	end

	private
	def product_params
		params.require(:product).permit(:name,:price,:image,:quantity)
	end

end
