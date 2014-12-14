require 'elasticsearch/model'

class City < ActiveRecord::Base
  extend FriendlyId
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

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
   indexes :cities, :type => 'multi_field', :fields => {
      :name            => { :type => "string"},
      :st_name         => { :type => "string"},
      :st_abbreviation => { :type => "string"},
      :search_analyzer => "search_ngram_analyzer",
      :index_analyzer  => "index_ngram_analyzer"
   }
  end

  def as_indexed_json(options = {})
    {
      :name            => self.name,
      :st_name         => self.state.name,
      :st_abbreviation => self.state.abbreviation
    }
  end

end
