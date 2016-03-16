class UsersController < ApplicationController
	before_action :authorize_user, only: [:show]

	def show
		@user = current_user
		render 'users/show'
	end

	def all_bands_events
		@user = current_user
		@bands = @user.bands
		@events = Event.all.order(date: :asc).to_a
	end
end
