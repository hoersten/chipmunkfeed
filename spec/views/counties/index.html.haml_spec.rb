require 'spec_helper'

describe "counties/index", type: 'view' do
  before(:each) do
    assign(:counties, [
      stub_model(County,
        :name => "Name",
        :type => "Type",
        :county_id => 1,
        :fips => "Fips"
      ),
      stub_model(County,
        :name => "Name",
        :type => "Type",
        :county_id => 1,
        :fips => "Fips"
      )
    ])
  end

  it "renders a list of counties" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Fips".to_s, :count => 2
  end
end
