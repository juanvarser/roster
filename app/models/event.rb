class Event < ActiveRecord::Base
	belongs_to :band
	has_one :venue
	has_many :finances
	has_attached_file :image
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	validates :price, numericality: true

	def set_band!(band)
		self.band_id = band.id
		self.save!
	end

	def event_completed
		self.completed = true
		self.save
	end
	
end
