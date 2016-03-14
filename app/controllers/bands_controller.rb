class BandsController < ApplicationController

	def index
		@bands = Band.all
	end

	def new
		@band = Band.new
	end

	def create
		@band = Band.new band_params
		if @band.save
			flash[:"is-success"] = "Rock on!You have created a new band"
			redirect_to action: :home, controller: :site
		else
			flash[:"alert"] = "Oops!Something went wrong..."
			render 'new'
		end
	end

	private

	def band_params
		params.require(:band).permit(:name,:description,:cache,:band_image)
	end

end
