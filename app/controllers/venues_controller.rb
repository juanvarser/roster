class VenuesController < ApplicationController
	def index
		@venues = Venue.all
	end

	def new
		@venue = Venue.new
	end

	def create
		@venue = Venue.new venue_params
		if @venue.save
			flash[:"is-success"] = "Rock on!You have created a new venue"
			redirect_to venues_path
		else
			flash[:"alert"] = "Oops!Something went wrong..."
			render 'new'
		end
	end

	private
	def venue_params
		params.require(:band).permit(:name,:address,:city,:cache,:mail,:phone,:contact_name)
	end

end
