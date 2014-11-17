json.array!(@states) do |state|
  json.extract! state, :id, :name, :abbreviation, :state_id, :fips
  json.url state_url(state, format: :json)
end
