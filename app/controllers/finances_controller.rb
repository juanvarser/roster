class FinancesController < ApplicationController
	
	def create
		@user = current_user
		@band = @user.bands.find_by id: params[:band_id]
		@event = @band.events.find_by id: params[:event_id]
		@finance = @event.finances.new finance_params
		if @finance.save
			flash[:"is-success"] = "Rock on!You have created a new band"
			redirect_to user_band_event_path id: params[:event_id]
		else
			@errors = @finance.errors.full_messages
			flash[:"is-alert"] = "Oops!Something went wrong..."
			render 'new'
		end
	end

	def destroy
		@user = current_user
		@band = @user.bands.find_by id: params[:band_id]
		@event = @band.events.find_by id: params[:event_id]
		@finance = @event.finances.find_by id: params[:id]
		@finance.destroy
		redirect_to user_band_event_path id: params[:event_id]
	end

	private
	def finance_params
		params.require(:finance).permit(:concept_type,:concept,:amount)
	end

end
