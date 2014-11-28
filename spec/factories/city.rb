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
    association :state, factory: :state
    association :county, factory: :county
  end
end
