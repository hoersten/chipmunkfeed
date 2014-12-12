class State < ActiveRecord::Base
  extend FriendlyId

  friendly_id :name, use: [:slugged, :finders]
  has_many :counties
  has_many :cities
  has_many :description, class_name: StateDescription

  validates_presence_of :name, :state_id, :slug, :latitude, :longitude
  validates :abbreviation, length: { in: 2..3 }	
  validates :fips, length: { is: 5 }
  validates :country, inclusion: { in: %w(US), message: "%{value} is not a valid country code" } 

  before_validation(on: :create) do
    self.fips = self.state_id.to_s.rjust(2, '0') + "000"
  end

  def capital
    City.find_by(state:self, state_capital: 1)
  end

  def active_description
    self.description.find_by(active: true)
  end

end
