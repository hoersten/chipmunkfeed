FactoryGirl.define do
  factory :state do
    name "Alabama"
    state_id 1
    abbreviation "AL"
    country "US"

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
        end
      end
    end

  end

end
