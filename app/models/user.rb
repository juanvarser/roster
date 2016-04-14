class User < ActiveRecord::Base
  has_many :bands
  has_many :venues
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true

  def self.band_events(events, band)
    band.events.where(completed: false).each { |event| events << event }
  end
end
