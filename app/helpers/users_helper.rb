module UsersHelper

	def get_venue venue_id
		Venue.find_by_id(venue_id)
	end

end
