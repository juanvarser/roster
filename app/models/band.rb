class Band < ActiveRecord::Base
	has_attached_file :image
	validates :name, presence: true
	validates :cache, numericality: true
	validates :description, length: {maximum: 250}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
