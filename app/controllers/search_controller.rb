class SearchController < ApplicationController
  def search
    @keywords      = params[:search_text]
    @state_search  = params[:state]
    @county_search = params[:county]
    @results       = []
    if (@keywords.present?)
#      @results       = State.search(@keywords).records.decorate
#      @results       += County.search(@keywords).records.decorate
#      @results       += City.search(@keywords).records.decorate
      @search = Search.new
      @search.query = @keywords
      @search.page = (params[:page] || 1).to_i
      @search.run
      @results = @search.records
    end
  end
end
