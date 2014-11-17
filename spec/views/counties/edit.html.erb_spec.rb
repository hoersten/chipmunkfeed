require 'spec_helper'

describe "counties/edit" do
  before(:each) do
    @county = assign(:county, stub_model(County,
      :name => "MyString",
      :type => "",
      :county_id => 1,
      :fips => "MyString"
    ))
  end

  it "renders the edit county form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => counties_path(@county), :method => "post" do
      assert_select "input#county_name", :name => "county[name]"
      assert_select "input#county_type", :name => "county[type]"
      assert_select "input#county_county_id", :name => "county[county_id]"
      assert_select "input#county_fips", :name => "county[fips]"
    end
  end
end
