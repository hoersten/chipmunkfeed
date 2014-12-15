class City < ActiveRecord::Base
  extend FriendlyId
  searchkick settings: {number_of_shards: 1}, text_start: [:auto_complete]

  friendly_id :build_slug, use: [:slugged, :finders]
  belongs_to :state
  belongs_to :county
  has_many :description, class_name: CityDescription

  validates_presence_of :name, :gnis, :slug, :county, :state
  validates :fips, length: { is: 5 }

  before_validation(on: :create) do
    self.fips = self.county.fips rescue ''
  end

  def build_slug
    [ self.name ]
  end

  def normalize_friendly_id(s)
    self.state.slug + '/' + super rescue super
  end

  def active_description
    self.description.find_by(active: true)
  end

  def search_data
    {
      name:            self.name,
      st_name:         self.state.name,
      st_abbreviation: self.state.abbreviation,
      auto_complete:   self.decorate.search_display
    }
  end

end
