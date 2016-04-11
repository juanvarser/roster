class BandsController < ApplicationController
	before_action :set_band, only: [:show, :update_band_info, :destroy]

	def index
		@bands = current_user.bands.order(id:'ASC')
	end

	def new
		@band = current_user.bands.new
	end

	def create
		@band = current_user.bands.new band_params
		@members = @band.members
		if @band.save
			flash[:"is-success"] = "Rock on!You have created a new band"
			redirect_to user_bands_path
		else
			@errors = @band.errors.full_messages
			flash[:"is-alert"] = "Oops!Something went wrong..."
			render 'new'
		end
	end

	def update_band_info
		members = band.members.all
		render status:200,
			json: {
				band: band,
				members: members
			}
			if @band.save band_params
				flash[:"is-success"] = "Band updated!"
			else
				flash[:"is-alert"] = "Oops, something went wrong..."
			end
		# if params[:band_description] != nil
		# band.description = params[:band_description]
		# end
		# if params[:band_cache] != nil
		# band.cache = params[:band_cache]
		# end
		# if params[:band_name] != nil
		# band.name = params[:band_name]
		# end
		# band.save
	end

	def show
		@members = @band.members.new
	end

	def destroy
		band.destroy
		redirect_to user_bands_path
	end

	private

	def set_band
		@band = current_user.bands.find_by id: params[:id]
	end

	def band_params
		params.require(:band).permit(
			:name,:description,:cache,:comission,:image,
			members_attributes:[:name,:instrument,:gear,:special_food]
			)
	end

end
