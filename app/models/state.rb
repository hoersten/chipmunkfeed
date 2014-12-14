require 'elasticsearch/model'

class State < ActiveRecord::Base
  extend FriendlyId
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

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

=begin
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
:search_analyzer    => "search_ngram_analyzer", :index_analyzer     => "index_ngram_analyzer",

  mapping :dynamic => false do
   indexes :states,
     :fields => {
      :state_name         => { :type => "string" },
      :state_abbreviation => { :type => "string" }
     },
     :analyzer => "english"
  end
=end

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name, analyzer: 'english'
      indexes :abbreviation, analyzer: 'english'
    end
  end

=begin
  def as_indexed_json(options = {})
    {
      :state_name         => self.name,
      :state_abbreviation => self.abbreviation
    }
  end
=end

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['name^10', 'abbreviation']
          }
        }
      }
    )
  end

end
