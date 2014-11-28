require 'spec_helper'

describe State do
  # Creation
  it ".new Success" do
    state = State.new(name: 'Test State',
                      state_id: 1,
                      abbreviation: 'TS',
                      country: 'US')
    expect(state).to be_valid
    expect(state.name).to eq('Test State')
    expect(state.slug).to eq('test-state')
    expect(state.state_id).to eq(1)
    expect(state.fips).to eq('01000')
    expect(state.abbreviation).to eq('TS')
    expect(state.country).to eq('US')
  end
  it ".new Fail Missing Name" do
    state = State.new(
                      state_id: 1,
                      abbreviation: 'TS',
                      country: 'US')
    expect(state).to be_invalid
  end
  it ".new Fail Missing ID" do
    state = State.new(name: 'Test State',
                      abbreviation: 'TS',
                      country: 'US')
    expect(state).to be_invalid
  end
  it ".new Fail Missing Abbreviation" do
    state = State.new(name: 'Test State',
                      state_id: 1,
                      country: 'US')
    expect(state).to be_invalid
  end
  it ".new Invalid Abbreviation" do
    state = State.new(name: 'Test State',
                      state_id: 1,
                      abbreviation: 'T',
                      country: 'US')
    expect(state).to be_invalid
    state2 = State.new(name: 'Test State',
                      state_id: 1,
                      abbreviation: 'THAA',
                      country: 'US')
    expect(state2).to be_invalid
  end
  it ".new Fail Missing Country" do
    state = State.new(name: 'Test State',
                      state_id: 1,
                      abbreviation: 'TS'
                      )
    expect(state).to be_invalid
  end
  it ".new Fail Invalid Country" do
    state = State.new(name: 'Test State',
                      state_id: 1,
                      abbreviation: 'TS',
                      country: 'MX')
    expect(state).to be_invalid
  end

  # Counties
  it ".counties Success" do
    state = FactoryGirl.create(:state_with_counties, name: 'Alabama', abbreviation: 'AL', state_id: 2, country: 'US')
    expect(state.counties.count).to eq 5
  end

  # Cities
  it ".cities Success" do
    state = FactoryGirl.create(:state_with_cities, name: 'Alabama', abbreviation: 'AL', state_id: 2, country: 'US')
    expect(state.cities.count).to eq 5
  end
end
