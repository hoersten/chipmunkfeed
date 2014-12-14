require 'elasticsearch/model'

class County < ActiveRecord::Base
  extend FriendlyId
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

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

  def capitals
    City.where(county:self).where.not(county_capital: nil).order(:county_capital)
  end

  def active_description
    self.description.find_by(active: true)
  end

  settings :analysis => {
    :filter => {
      :trip_ngram  => {
        "type"     => "edgeNGram",
        "max_gram" => 15,
        "min_gram" => 2
      }
    },
    :analyzer => {
      :index_ngram_analyzer => {
        "type" => "custom",
        "tokenizer" => "standard",
        "filter" => [ "standard", "lowercase", "trip_ngram" ]
      },
      :search_ngram_analyzer => {
        "type" => "custom",
        "tokenizer" => "standard",
        "filter" => [ "standard", "lowercase"]
      },
    }
  }

  mapping do
   indexes :counties, :type => 'multi_field', :fields => {
      :name            => { :type => "string"},
      :county_type     => { :type => "string"},
      :st_name         => { :type => "string"},
      :st_abbreviation => { :type => "string"},
      :search_analyzer => "search_ngram_analyzer",
      :index_analyzer  => "index_ngram_analyzer"
   }
  end

  def as_indexed_json(options = {})
    {
      :name            => self.name,
      :county_type     => self.county_type,
      :st_name         => self.state.name,
      :st_abbreviation => self.state.abbreviation
    }
  end

end
