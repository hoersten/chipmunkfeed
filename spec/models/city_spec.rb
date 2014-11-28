require 'spec_helper'

describe City do
  # Creation
  it ".new Success" do
    state  = FactoryGirl.create(:state, state_id: 2)
    county = FactoryGirl.create(:county, county_id: 44, state: state)
    city = City.new(name: 'Test City',
                    gnis: '1003',
                    state: state,
                    county: county)
    expect(city).to be_valid
    expect(city.name).to eq('Test City')
    expect(city.slug).to eq(state.slug + '/test-city')
    expect(city.fips).to eq('02044')
    expect(city.gnis).to eq('1003')
    expect(city.county).to eq(county)
    expect(city.state).to eq(state)
  end
  it ".new Fail Missing Name" do
    state  = FactoryGirl.create(:state)
    county = FactoryGirl.create(:county, state: state)
    city = City.new(
                    gnis: '1003',
                    state: state,
                    county: county)
    expect(city).to be_invalid
  end
  it ".new Fail Missing GNIS" do
    state  = FactoryGirl.create(:state)
    county = FactoryGirl.create(:county, state: state)
    city = City.new(name: 'Test City',
                    state: state,
                    county: county)
    expect(city).to be_invalid
  end
  it ".new Fail Missing State" do
    state  = FactoryGirl.create(:state)
    county = FactoryGirl.create(:county, state: state)
    city = City.new(name: 'Test City',
                    gnis: '1003',
                    county: county)
    expect(city).to be_invalid
  end
  it ".new Missing County" do
    state  = FactoryGirl.create(:state)
    city = City.new(name: 'Test City',
                    gnis: '1003',
                    state: state
                   )
    expect(city).to be_invalid
  end
  it ".latitude Success" do
    state  = FactoryGirl.create(:state)
    county = FactoryGirl.create(:county, state: state)
    city = City.new(name: 'Test City',
                    gnis: '1003',
                    state: state,
                    county: county)
    expect(city.latitude).to eq(nil)
    city.latitude = 51.8800000
    expect(city.latitude).to eq(51.8800000)
    city.save
    city2 = City.find(city.id)
    expect(city2.latitude).to eq(51.8800000)
  end
  it ".longitude Success" do
    state  = FactoryGirl.create(:state)
    county = FactoryGirl.create(:county, state: state)
    city = City.new(name: 'Test City',
                    gnis: '1003',
                    state: state,
                    county: county)
    expect(city.longitude).to eq(nil)
    city.longitude = -176.6580556
    expect(city.longitude).to eq(-176.6580556)
    city.save
    city2 = City.find(city.id)
    expect(city2.longitude).to eq(-176.6580556)
  end
  it ".msa Success" do
    state  = FactoryGirl.create(:state)
    county = FactoryGirl.create(:county, state: state)
    city = City.new(name: 'Test City',
                    gnis: '1003',
                    state: state,
                    county: county)
    expect(city.msa).to eq(nil)
    city.msa = 11260
    expect(city.msa).to eq(11260)
    city.save
    city2 = City.find(city.id)
    expect(city2.msa).to eq(11260)
  end
  it ".usa Success" do
    state  = FactoryGirl.create(:state)
    county = FactoryGirl.create(:county, state: state)
    city = City.new(name: 'Test City',
                    gnis: '1003',
                    state: state,
                    county: county)
    expect(city.usa).to eq(nil)
    city.usa = 27940
    expect(city.usa).to eq(27940)
    city.save
    city2 = City.find(city.id)
    expect(city2.usa).to eq(27940)
  end
  it ".cbsa Success" do
    state  = FactoryGirl.create(:state)
    county = FactoryGirl.create(:county, state: state)
    city = City.new(name: 'Test City',
                    gnis: '1003',
                    state: state,
                    county: county)
    expect(city.cbsa).to eq(nil)
    city.cbsa = 27940
    expect(city.cbsa).to eq(27940)
    city.save
    city2 = City.find(city.id)
    expect(city2.cbsa).to eq(27940)
  end
  it ".csa Success" do
    state  = FactoryGirl.create(:state)
    county = FactoryGirl.create(:county, state: state)
    city = City.new(name: 'Test City',
                    gnis: '1003',
                    state: state,
                    county: county)
    expect(city.csa).to eq(nil)
    city.csa = 194
    expect(city.csa).to eq(194)
    city.save
    city2 = City.find(city.id)
    expect(city2.csa).to eq(194)
  end
  it ".psa Success" do
    state  = FactoryGirl.create(:state)
    county = FactoryGirl.create(:county, state: state)
    city = City.new(name: 'Test City',
                    gnis: '1003',
                    state: state,
                    county: county)
    expect(city.psa).to eq(nil)
    city.psa = 194
    expect(city.psa).to eq(194)
    city.save
    city2 = City.find(city.id)
    expect(city2.psa).to eq(194)
  end
  it ".dma Success" do
    state  = FactoryGirl.create(:state)
    county = FactoryGirl.create(:county, state: state)
    city = City.new(name: 'Test City',
                    gnis: '1003',
                    state: state,
                    county: county)
    expect(city.dma).to eq(nil)
    city.dma = 743
    expect(city.dma).to eq(743)
    city.save
    city2 = City.find(city.id)
    expect(city2.dma).to eq(743)
  end
end
