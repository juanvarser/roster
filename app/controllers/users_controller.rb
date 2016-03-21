class UsersController < ApplicationController
	before_action :authorize_user, only: [:show]

	def show
		@user = current_user
		render 'users/show'
	end

	def all_bands_events
		bands = current_user.bands.to_a
		@events = []
		bands.each do |band|
			@events << band.events.all
		end
	end
end
