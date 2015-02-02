FactoryGirl.define do
  factory :county do
    name "Autauga"
    county_id 1
    county_type "County"
    population 54571
    area 604.45
    association :state, factory: :state

    trait :county_with_invalid_id do
      county_id -1
    end

    factory :county_with_cities do
      transient do
        city_count 5
      end
      after(:create) do |county, evaluator|
        create_list(:city, evaluator.city_count, state: county.state, county: county)
      end
    end
  end
end
