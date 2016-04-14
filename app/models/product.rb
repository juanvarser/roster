class Product < ActiveRecord::Base
  belongs_to :band
  validates :name, presence: true
  validates :price, numericality: true
  validates :quantity, numericality: true
  validates :description, length: { maximum: 250 }
  has_attached_file :image, default_url: 'missing_:avatar.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
