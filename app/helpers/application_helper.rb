module ApplicationHelper
  def state_path(state)
    '/' + state.slug
  end

  def county_path(county)
    '/' + county.slug
  end

  def county_cities_path(args)
    '/' + args[:county].slug + '/cities'
  end

  def city_path(city)
    '/' + city.slug
  end
end
