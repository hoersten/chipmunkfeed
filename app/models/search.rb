class Search
  def search(query, page = 1, per_page = 24)
    fields = ["state_name^10", "state_abbreviation^10", "name^2", "county_type^10", "st_name", "st_abbreviation", "auto_complete"]
    _search(query, page, per_page, fields)
  end

  def autocomplete(query, page = 1, per_page = 5)
    fields = [{"state_name^10" => :text_start}, {"state_abbreviation^10" => :text_start}, {"auto_complete" => :text_start}]
    _search(query, page, per_page, fields)
  end

  def total_count
    @response.total_count
  end

  def results
    @response.results
  end

  # Pagination
  def current_page
    @response.current_page
  end

  def total_pages
    @response.total_pages
  end

  def limit_value
    @response.limit_value
  end

  private
    def _search(query, page, per_page, fields)
      @response = 
        State.search(query, 
                     index_name: [State.searchkick_index.name, County.searchkick_index.name, City.searchkick_index.name], 
                     fields: fields,
                     page: page, 
                     per_page: per_page
                    )
    end

end
