class Venue < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_attached_file :image, default_url: 'venue.jpg'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_size :image, less_than: 1.megabytes,
                                    unless: proc { |model| model.image }
end
