require 'spec_helper'

describe "cities/show", type: 'view' do
  before(:each) do
    @city = assign(:city, stub_model(City,
        :name => "Columbus",
        :state => stub_model(State,
          :name => 'Ohio',
          :slug => 'ohio'
        ),
        :county => stub_model(County,
          :name => 'Franklin',
          :county_type => 'County',
          :slug => 'franklin-county'
        ),
        :latitude => "9.99",
        :longtitude => "9.99",
        :gnis => "Gnis",
        :fips => "Fips",
        :msa => 1,
        :usa => 2,
        :cbsa => 3,
        :csa => 4,
        :psa => 5,
        :dma => 6,
        :state_capital => true,
        :county_capital => true
    ).decorate)
  end

  it "renders title" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/<h1[^>]*>[\s]*Columbus[\s]*<\/h1>/)
  end

  it "renders state capital" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/<h1[^>]*>[\s]*Columbus[\s]*<\/h1>/)
  end
end
