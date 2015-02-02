FactoryGirl.define do
  factory :state do
    name "Alabama"
    state_id 1
    abbreviation "AL"
    country "US"
    latitude 32.61
    longitude -86.8073
    population 4833722
    area 52419

    trait :state_with_invalid_id do
      state_id -1
    end

    factory :state_with_counties do
      transient do
        county_count 5
      end
      after(:create) do |state, evaluator|
        create_list(:county, evaluator.county_count, state: state)
      end

      factory :state_with_cities do
        transient do
          city_count 5
        end
        after(:create) do |state, evaluator|
          create_list(:city, evaluator.city_count, state: state, county: state.counties.order("RAND()").first)
          c = state.cities.first
          c.state_capital = true
          c.save
        end
      end
    end

  end

end
