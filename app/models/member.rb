class Member < ActiveRecord::Base
	belongs_to :band
	validates :name, presence: true
	validates :special_food, :inclusion => { :in => [true, false] }
end
