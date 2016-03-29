class Finance < ActiveRecord::Base
	belongs_to :event
	validates :amount, numericality: true
	validates :amount, presence: true
	validates :concept_type, presence: true
	validates :concept, length: {maximum: 100}
end
