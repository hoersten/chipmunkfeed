class State < ActiveRecord::Base
  extend FriendlyId
  searchkick settings: {number_of_shards: 1}, text_start: [:auto_complete], text_start: [:state_name]

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

  def search_data
    {
      state_name:         self.name,
      state_abbreviation: self.abbreviation,
      auto_complete:      self.decorate.search_display
    }
  end

end
