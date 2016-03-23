class BandsController < ApplicationController

	def index
		@user = current_user
		@bands = @user.bands.order(id:'ASC')
	end

	def new
		@band = current_user.bands.new
	end

	def create
		@user = current_user
		@band = @user.bands.new band_params
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

	def update_band_info
		band = current_user.bands.find_by id: params[:band_id]
		if params[:band_description] != nil
		band.description = params[:band_description]
		end
		if params[:band_cache] != nil
		band.cache = params[:band_cache]
		end
		members = band.members.all
		render status:200,
			json: {
				band: band,
				members: members
			}
		band.save
	end

	def show
		@band = current_user.bands.find_by id: params[:id]
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
