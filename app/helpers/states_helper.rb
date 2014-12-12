module StatesHelper
  def state_counties_path(state)
    '/' + state.slug + '/counties'
  end
  def state_cities_path(state)
    '/' + state.slug + '/cities'
  end
end
