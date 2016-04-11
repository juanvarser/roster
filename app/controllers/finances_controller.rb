class FinancesController < ApplicationController
	before_action :set_finance
	
	def create
		@finance = event.finances.new finance_params
		if @finance.save
			redirect_to :back
			flash[:"is-success"] = "Rock on!You have created a new band"
		else
			@errors = @finance.errors.full_messages
			render 'new'
			flash[:"is-alert"] = "Oops!Something went wrong..."
		end
	end

	def destroy
		@finance = event.finances.find_by id: params[:id]
		@finance.destroy
		redirect_to :back
		flash[:"is-alert"] = "Finance deleted"
	end

	private
	def set_finance
		band = current_user.bands.find_by id: params[:band_id]
		event = band.events.find_by id: params[:event_id]
	end

	def finance_params
		params.require(:finance).permit(:concept_type,:concept,:amount)
	end

end
