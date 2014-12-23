FactoryGirl.define do
  factory :city do
    name "Autaugaville"
    latitude 32.4340249
    longitude -86.6547019
    gnis "113299"
    msa 33860
    usa nil
    cbsa 33860
    csa nil
    psa 33860
    dma 698
    population 870
    area 20.2
    association :state, factory: :state
    association :county, factory: :county

    factory :city_with_county_capital do
      after(:create) do |city, evaluator|
        city.county_capital = true
      end
    end

    factory :city_with_state_capital do
      after(:create) do |city, evaluator|
        city.state_capital = true
      end
    end

    factory :city_with_state_and_county_capital do
      after(:create) do |city, evaluator|
        city.state_capital = true
        city.county_capital = true
      end
    end
  end
end
