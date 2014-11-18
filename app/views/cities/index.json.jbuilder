json.array!(@cities) do |city|
  json.extract! city, :id, :belongs_to, :belongs_to, :name, :latitude, :longtitude, :gnis, :fips, :msa, :usa, :cbsa, :csa, :psa, :dma
  json.url city_url(city, format: :json)
end
