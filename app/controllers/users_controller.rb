class UsersController < ApplicationController
	before_action :authorize_user, only: [:show]

	def show
		@user = current_user
		render 'users/show'
	end
end
