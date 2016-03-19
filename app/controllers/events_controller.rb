class EventsController < ApplicationController
	respond_to :json

	def index
		@user = current_user
		@band = @user.bands.find_by id: params[:band_id]
		@events = @band.events.all
	end

	def new
		@user = current_user
		@venue = @user.venues.all
		@band = @user.bands.find_by id: params[:band_id]
		@event = @band.events.new
	end

	def show
		@user = current_user
		@band = @user.bands.find_by id: params[:band_id]
		@event = @band.events.find_by id: params[:id]
		@finance = Finance.new
	end

	def update
		@user = current_user
		@band = @user.bands.find_by id: params[:band_id]
		@event = @band.events.find_by id: params[:id]
		@finance = @event.finances.all.to_a
		event_json = {
			user: @user.id,
			band: @band,
			event: @event,
			finance: @finance
		}
		redirect_to :back
		flash[:"is-success"] = "Great! You have generated a new report event"
	end

	def create
		@user = current_user
		@band = @user.bands.find_by id: params[:band_id]
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

	def destroy
		user = current_user
		band = user.bands.find_by id: params[:band_id]
		@event = band.events.find_by id: params[:id]
		@event.destroy
		redirect_to user_band_events_path
	end

	def close_event
		@user = current_user
		@band = @user.bands.find_by id: params[:band_id]
		@event = @band.events.find_by id: params[:event_id]
		@event.event_completed
		if @event.save
		flash[:"is-success"] = "Rock on!You have closed this event"
		redirect_to user_band_events_path
		end
	end

	private
	def event_params
		params.require(:event).permit(:price,:date,:time,:image,:venue_id)
	end

end
