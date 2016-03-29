class EventsController < ApplicationController
	respond_to :json

	def index
		@band = current_user.bands.find_by id: params[:band_id]
		@events = @band.events.all.order(date: 'ASC')
	end

	def new
		@venue = current_user.venues.all
		@band = current_user.bands.find_by id: params[:band_id]
		@event = @band.events.new
	end

	def show
		@band = current_user.bands.find_by id: params[:band_id]
		@event = @band.events.find_by id: params[:id]
		@finance = @event.finances.new
	end

	def edit
		@band = current_user.bands.find_by id: params[:band_id]
		@event = @band.events.find_by id: params[:id]

	end

	def update
		@band = current_user.bands.find_by id: params[:band_id]
		@event = @band.events.find_by id: params[:id]
		if @event.update event_params
			@event.finances.find_by(concept:'Venue Cache').destroy
			Event.add_venue_cache_to_finances(@event.id,@event.venue_id)
			flash[:"is-success"] = "Great! You have updated a new report event"
			redirect_to user_band_event_path id: params[:id]
		else
			@errors = @event.errors.full_messages
			render 'edit'
		end
	end

	def create
		@band = current_user.bands.find_by id: params[:band_id]
		@event = Event.new event_params
		if @event.save
			@event.set_band!(@band)
			if @event.event_type == 'band_cache'
				Event.add_band_cache_to_finances(@event.id,@band.cache)
			end

			Event.add_venue_cache_to_finances(@event.id,@event.venue_id)
			flash[:"is-success"] = "Rock on!You have created a new event"
			redirect_to user_band_event_path id: @event.id
		else
			@errors = @event.errors.full_messages
			flash[:"is-alert"] = "Oops!Something went wrong..."
			render 'new'
		end
	end

	def destroy
		band = current_user.bands.find_by id: params[:band_id]
		@event = band.events.find_by id: params[:id]
		@event.destroy
		redirect_to user_band_events_path
	end

	def close_event
		@band = current_user.bands.find_by id: params[:band_id]
		@event = @band.events.find_by id: params[:event_id]
		@event.event_completed
		
		payload = [
			@event.finances.where(concept_type: "Receive"),
			@event.finances.where(concept_type: "Expense")
		]

		Event.generate_report(@event.id,@event.date,payload.to_json)

		if @event.save
			flash[:"is-success"] = "Rock on!You have closed this event"
			redirect_to user_band_events_path
		end
	end

	def get_event_info
		band = current_user.bands.find_by id: params[:band_id]
		event = band.events.find_by id: params[:event_id]
		render status: 200, json: event.to_json

	end

	def get_route_map
		@band = current_user.bands.find_by id: params[:band_id]
		@event = @band.events.find_by id: params[:id]
		@example = "Hello World!"
		render pdf: @example
	end

	private
	def event_params
		params.require(:event).permit(:price,:date,:time,:image,:venue_id,:event_type)
	end

end
