require 'spec_helper'

describe 'cities/index', type: 'view' do
  before(:each) do
    @state = assign(:state, stub_model(State,
      :name => 'Ohio',
      :slug => 'ohio'
    ).decorate)
    @cities = assign(:cities, [
      stub_model(City,
        :name => 'Columbus',
        :slug => 'ohio/columbus',
        :state => stub_model(State,
          :name => 'Ohio',
          :slug => 'ohio'
        ),
        :county => stub_model(County,
          :name => 'Franklin',
          :slug => 'franklin-county',
          :county_type => 'county'
        ),
        :latitude => '9.99',
        :longtitude => '9.99',
        :gnis => 'Gnis',
        :fips => 'Fips',
        :msa => 1,
        :usa => 2,
        :cbsa => 3,
        :csa => 4,
        :psa => 5,
        :dma => 6,
        :state_capital => true,
        :county_capital => true
      ).decorate,
      stub_model(City,
        :name => 'Cincinnati',
        :slug => 'ohio/cincinnati',
        :state => stub_model(State,
          :name => 'Ohio',
          :slug => 'ohio'
        ),
        :county => stub_model(County,
          :name => 'Hamilton',
          :slug => 'hamilton-county',
          :county_type => 'county'
        ),
        :latitude => '9.99',
        :longtitude => '9.99',
        :gnis => 'Gnis',
        :fips => 'Fips',
        :msa => 1,
        :usa => 2,
        :cbsa => 3,
        :csa => 4,
        :psa => 5,
        :dma => 6,
        :state_capital => false,
        :county_capital => true
      ).decorate,
      stub_model(City,
        :name => 'Ada',
        :slug => 'ohio/ada',
        :state => stub_model(State,
          :name => 'Ohio',
          :slug => 'ohio'
        ),
        :county => stub_model(County,
          :name => 'Hardin',
          :slug => 'hardin-county',
          :county_type => 'county'
        ),
        :latitude => '9.99',
        :longtitude => '9.99',
        :gnis => 'Gnis',
        :fips => 'Fips',
        :msa => 1,
        :usa => 2,
        :cbsa => 3,
        :csa => 4,
        :psa => 5,
        :dma => 6,
        :state_capital => false,
        :county_capital => false
      ).decorate
    ])
  end

  it 'renders a list of cities in a state' do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'ul.cities>li', :count => 3
    expect(rendered).to match(/Columbus (State Capital) (County Capital)/)
  end
end
