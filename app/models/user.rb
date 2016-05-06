class User < ActiveRecord::Base
  before_create :set_default_role
  belongs_to :role
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

  private

  def set_default_role
    self.role ||= Role.find_by_name('admin')
  end
end
