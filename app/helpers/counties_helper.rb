module CountiesHelper
  def county_cities_path(county)
    '/' + county.slug + '/cities'
  end
end
