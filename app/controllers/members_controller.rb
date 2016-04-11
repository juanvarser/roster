class MembersController < ApplicationController
	before_action :set_members

	def new
		@members = @band.members.new member_params
	end

	def create
		@members = @band.members.new member_params
		if @members.save
			flash[:"is-success"] = "Rock on!You have added a new member"
			redirect_to user_band_path id: params[:band_id]
		else
			@errors = @members.errors.full_messages
			flash[:"is-alert"] = "Oops!Something went wrong..."
			render 'new'
		end
	end

	def destroy
		@members = @band.members.find_by id: params[:id]
		@members.destroy
		redirect_to user_band_path id: params[:band_id]
	end

	private
	def set_members
		@band = current_user.bands.find_by id: params[:band_id]
	end
	def member_params
		params.require(:member).permit(:name,:instrument,:gear,:special_food)
	end
end