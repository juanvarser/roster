class Band < ActiveRecord::Base
	has_one :finance
	has_many :products
	belongs_to :user
	has_attached_file :image
	validates :name, presence: true
	validates :cache, numericality: true
	validates :description, length: {maximum: 250}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	def set_user!(user)
		self.user_id = user.id
		self.save!
	end
	
end
