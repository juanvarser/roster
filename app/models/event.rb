class Event < ActiveRecord::Base
	belongs_to :band
	has_one :venue

	def set_band!(band)
		self.band_id = band.id
		self.save!
	end

	def get_venue
	end
end
