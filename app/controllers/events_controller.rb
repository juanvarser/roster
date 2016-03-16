class EventsController < ApplicationController
	
	def index
		@user = current_user
		@band = @user.bands.find_by user_id: params[:user_id], id: params[:band_id]
		@events = @band.events.all
	end

	def new
		@user = current_user
		@venue = @user.venues.all
		@band = @user.bands.find_by user_id: params[:user_id], id: params[:band_id]
		@event = @band.events.new
	end

	def create
		@user = current_user
		@band = @user.bands.find_by user_id: params[:user_id], id: params[:band_id]
		venue = Venue.find params[:event][:venue_id]
		params[:event][:venue] = venue
		@event = Event.new event_params
		if @event.save
			@event.set_band!(@band)
			flash[:"is-success"] = "Rock on!You have created a new event"
			redirect_to user_band_events_path
		else
			@errors = @event.errors.full_messages
			flash[:"is-alert"] = "Oops!Something went wrong..."
			render 'new'
		end
	end

	private
	def event_params
		params.require(:event).permit(:price,:date,:time,:image,:venue_id)
	end

end
