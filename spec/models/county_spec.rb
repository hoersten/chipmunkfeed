require 'spec_helper'

describe County do
  # Creation
  it ".new Success" do
    state = FactoryGirl.create(:state, state_id: 2)
    county = County.new(name: 'Test County',
                      county_id: 1,
                      county_type: 'County',
                      population: 111244,
                      area: 110014.14,
                      state: state)
    expect(county).to be_valid
    expect(county.name).to eq('Test County')
    expect(county.slug).to eq(state.slug + '/test-county-county')
    expect(county.county_id).to eq(1)
    expect(county.fips).to eq('02001')
    expect(county.population).to eq(111244)
    expect(county.area).to eq(110014.14)
    expect(county.county_type).to eq('County')
  end
  it ".new Fail Missing Name" do
    state = FactoryGirl.create(:state)
    county = County.new(
                      county_id: 1,
                      county_type: 'County',
                      state: state)
    expect(county).to be_invalid
  end
  it ".new Fail Missing ID" do
    state = FactoryGirl.create(:state)
    county = County.new(name: 'Test County',
                      county_type: 'County',
                      state: state)
    expect(county).to be_invalid
  end
  it ".new Fail Missing Type" do
    state = FactoryGirl.create(:state)
    county = County.new(name: 'Test County',
                      county_id: 1,
                      state: state)
    expect(county).to be_invalid
  end
  it ".new Invalid Type" do
    state = FactoryGirl.create(:state)
    county = County.new(name: 'Test County',
                      county_id: 1,
                      county_type: 'Invalid Type',
                      state: state)
    expect(county).to be_invalid
    county2 = County.new(name: 'Test County',
                      county_id: 1,
                      county_type: 'Borogh',
                      state: state)
    expect(county2).to be_invalid
  end
  it ".new Fail Missing State" do
    county = County.new(name: 'Test County',
                      county_id: 1,
                      county_type: 'County'
                      )
    expect(county).to be_invalid
  end

  # Cities
  it ".cities Success" do
    state = FactoryGirl.create(:state)
    county = FactoryGirl.create(:county_with_cities, name: 'Test County', county_type: 'County', county_id: 2, state: state)
    expect(county.cities.count).to eq 5
  end
end
