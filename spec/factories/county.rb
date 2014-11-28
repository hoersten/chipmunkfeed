FactoryGirl.define do
  factory :county do
    name "Autauga"
    county_id 1
    county_type "County"
    association :state, factory: :state

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
