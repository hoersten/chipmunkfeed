class County < ActiveRecord::Base
  extend FriendlyId

  friendly_id :build_slug, use: [:slugged, :finders]
  belongs_to :state
  has_many :cities
  has_many :description, class_name: CountyDescription

  validates_presence_of :name, :county_id, :slug, :state
  validates :county_type, inclusion: { in: ['Borough', 'Census Area', 'County', 'Parish', 'City'], message: "%{value} is not a valid county type" }
  validates :fips, length: { is: 5 }

  before_validation(on: :create) do
    self.fips = self.state.state_id.to_s.rjust(2, '0') + self.county_id.to_s.rjust(3, '0') rescue ''
  end

  def build_slug
    [ [ self.name, self.county_type ] ]
  end

  def normalize_friendly_id(s)
    self.state.slug + '/' + super rescue super
  end

  def active_description
    self.description.find_by(active: true)
  end

end
