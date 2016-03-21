module EventsHelper

	def get_venue venue_id
		Venue.find_by_id(venue_id)
	end

	def get_finance event_id
		Finance.all.where(event_id: event_id)
	end
	
end
