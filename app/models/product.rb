class Product < ActiveRecord::Base
	belongs_to :band
	validates :name, presence: true
	validates :price, numericality: true
	validates :quantity, numericality: true
	validates :description, length: {maximum: 250}
end
