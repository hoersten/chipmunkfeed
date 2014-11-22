class City < ActiveRecord::Base
  extend FriendlyId

  friendly_id :build_slug, use: [:slugged, :finders]
  belongs_to :state
  belongs_to :county
  has_many :description, class_name: CityDescription

  validates_presence_of :name, :gnis, :slug
  validates :fips, length: { is: 5 }

  before_validation(on: :create) do
    self.fips = self.county.fips
  end

  def build_slug
    [ self.name ]
  end

  def normalize_friendly_id(s)
    self.state.slug + '/' + super
  end

  def active_description
    self.description.find_by(active: true)
  end

end
