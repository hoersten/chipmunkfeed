module ApplicationHelper
  def state_path(state)
    '/' + state.slug
  end

  def county_path(county)
    '/' + county.slug
  end

  def city_path(city)
    '/' + city.slug
  end
end
