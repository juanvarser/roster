module EventsHelper

	def get_venue_name venue_id
		Venue.find_by_id(venue_id).name
	end

	def get_venue_address venue_id
		Venue.find_by_id(venue_id).address
	end

	def get_venue_city venue_id
		Venue.find_by_id(venue_id).city
	end

end
