json.array!(@counties) do |county|
  json.extract! county, :id, :name, :type, :county_id, :fips
  json.url county_url(county, format: :json)
end
