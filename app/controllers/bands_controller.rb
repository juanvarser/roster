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
			redirect_to bands_path
		else
			flash[:"alert"] = "Oops!Something went wrong..."
			render 'new'
		end
	end

	def show
		@band = Band.find_by_id(params[:id])
	end

	private

	def band_params
		params.require(:band).permit(:name,:description,:cache,:image)
	end

end
