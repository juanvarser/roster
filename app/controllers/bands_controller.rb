class BandsController < ApplicationController

	def index
		@user = current_user
		@bands = Band.all
	end

	def new
		@user = current_user
		@band = @user.bands.new
	end

	def create
		@user = current_user
		@band = Band.new band_params
		@band.set_user!(@user)
		if @band.save
			flash[:"is-success"] = "Rock on!You have created a new band"
			redirect_to user_bands_path
		else
			flash[:"alert"] = "Oops!Something went wrong..."
			render 'new'
		end
	end

	def show
		@user = current_user
		@band = @user.bands.find_by id: params[:id]
	end

	private

	def band_params
		params.require(:band).permit(:name,:description,:cache,:image)
	end

end
