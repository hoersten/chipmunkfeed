class SearchController < ApplicationController
  def search
    @keywords      = params[:search_text]
    @state_search  = params[:state]
    @county_search = params[:county]
    @auto_select   = params[:auto_select]
    @results       = []
    if (@keywords.present?)
      @search = Search.new
      @search.search(@keywords, (params[:page] || 1).to_i)
      if (@search.total_count == 1)
        redirect_to '/' + @search.results.first.slug
        return
      end
    end
  end

  def autocomplete
    s = Search.new
    res = s.autocomplete(params[:term], 1, 5)
    r = []
    res.each do |p|
      r << p.decorate.search_display
    end
    render json: r
  end
end
