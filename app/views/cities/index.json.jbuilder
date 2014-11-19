json.array!(@cities) do |city|
  json.extract! city, :id, :state, :county, :name, :latitude, :longitude, :gnis, :fips, :msa, :usa, :cbsa, :csa, :psa, :dma
  json.url city_url(city, format: :json)
end
