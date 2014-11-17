require 'spec_helper'

describe "counties/show" do
  before(:each) do
    @county = assign(:county, stub_model(County,
      :name => "Name",
      :type => "Type",
      :county_id => 1,
      :fips => "Fips"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Type/)
    rendered.should match(/1/)
    rendered.should match(/Fips/)
  end
end
