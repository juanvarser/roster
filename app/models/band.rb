class Band < ActiveRecord::Base
  has_one :finance
  has_many :members
  has_many :products
  has_many :events
  belongs_to :user
  has_attached_file :image, default_url: 'band.jpg'
  validates :name, presence: true
  validates :cache, numericality: true
  validates :comission, numericality: true
  validates :description, length: { maximum: 500 }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  accepts_nested_attributes_for :members
end
