class BandsController < ApplicationController

	def index
		@user = current_user
		@bands = @user.bands
	end

	def new
		@user = current_user
		@band = @user.bands.new
	end

	def create
		@user = current_user
		@band = Band.new band_params
		if @band.save
			@band.set_user!(@user)
			flash[:"is-success"] = "Rock on!You have created a new band"
			redirect_to user_bands_path
		else
			@errors = @band.errors.full_messages
			flash[:"is-alert"] = "Oops!Something went wrong..."
			render 'new'
		end
	end

	def show
		@user = current_user
		@band = @user.bands.find_by id: params[:id]
	end

	def destroy
		band = current_user.bands.find_by id: params[:id]
		band.destroy
		redirect_to user_bands_path
	end

	private

	def band_params
		params.require(:band).permit(:name,:description,:cache,:comission,:image)
	end

end
