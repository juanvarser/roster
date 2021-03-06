class Event < ActiveRecord::Base
  belongs_to :band
  has_one :venue
  has_one :report
  has_many :finances
  has_attached_file :image, default_url: 'band.jpg'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :price, numericality: true
  validates :event_type, inclusion: %w(band_cache box_office)
  validates_date :date, on_or_after: -> { Date.current }
  accepts_nested_attributes_for :finances

  def event_completed
    self.completed = true
  end

  def self.on_tour
    where(completed: false).count
  end

  def self.expired
    where(completed: true).count
  end

  def self.get_venue_cache(id)
    venue = Venue.find_by id: id
    venue.cache
  end

  def self.add_venue_cache_to_finances(id, venue_id)
    Finance.create(
      concept: 'Venue Cache',
      concept_type: 'Expense',
      amount: get_venue_cache(venue_id),
      event_id: id
    )
  end

  def self.add_band_cache_to_finances(id, band_cache)
    Finance.create(
      concept: 'Band Cache',
      concept_type: 'Receive',
      amount: band_cache,
      event_id: id
    )
  end
end
