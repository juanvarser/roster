class Band < ActiveRecord::Base
	has_attached_file :band_image
	validates :name, presence: true
	validates :cache, numericality: true
	validates :description, length: {maximum: 250}
	validates_attachment_content_type :band_image, content_type: /\Aimage\/.*\Z/
end
