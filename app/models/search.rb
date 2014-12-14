# Modified from https://github.com/linuxfrorg/linuxfr.org/commit/d2fb186b033ea3092c2dabe5ad508d588785fbe5

class Search
  include Elasticsearch::Model

  Models = [State, County, City]

  FACET_BY_TYPE = {
    'state'  => 'state',
    'county' => 'county',
    'city'   => 'city'
  }

  PER_PAGE = 24

  class MultipleModels < Array
    def client
      Elasticsearch::Model.client
    end

    def ancestors
      []
    end

    def default_per_page
      PER_PAGE
    end
  end

  attr_accessor :query, :page, :type, :value, :start, :order
  attr_reader :results

  def run
    query = Jbuilder.encode do |json|
      json.query do
        json.filtered do
          json.query do
            json.multi_match do
              json.query @query
              json.type :cross_fields
              json.fields ["state_abbreviation^100", "state_name^100", "name", "abbreviation", "county_type^10", "st_name", "st_abbreviation"]
              json.operator 'and'
              json.analyzer 'english'
            end
          end

          filters = []
          filters << { :term => { facet => @value } } if @value
          json.filter do
            json.and filters
          end if filters.any?
        end
      end

      json.aggs do
        json.types do
          json.terms do
            json.field "_type"
            json.order do
              json._count "desc"
            end
          end
        end unless @type
        json.facets do
          json.terms do
            json.field facet
            json.order do
              json._count "desc"
            end
          end
        end if facet && !@value
      end

      json.sort [ { :created_at => :desc } ] if @order
    end

    query = MultiJson.load(query, :symbolize_keys => true)

    if @type
      klass = @type.camelize.constantize rescue nil
      if Models.include? klass
        response = klass.search query
      end
    end

    if response.nil?
      models  = MultipleModels.new(Models)
      options = {
       :index => models.map { |c| c.index_name },
       :type  => models.map { |c| c.document_type }
      }
      search  = Searching::SearchRequest.new(models, query, options)
      response = Response::Response.new(models, search)
    end

    @response = response.page(@page)
  end

  def types
    aggregations.types.buckets
  end

  def facets
    aggregations.facets.buckets
  end

  def aggregations
    @aggregations ||= Hashie::Mash.new @response.response['aggregations']
  end

  def facet
    @facet ||= FACET_BY_TYPE[@type]
  end

  def total_count
    results.total_count
  end

  def results
    @response.results
  end

  def records
    @response.map { |r| r['_type'].classify.constantize.find(r['_id']) }
  end
end
