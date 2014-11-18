require 'spec_helper'

describe "cities/index" do
  before(:each) do
    assign(:cities, [
      stub_model(City,
        :belongs_to => "",
        :belongs_to => "",
        :name => "Name",
        :latitude => "9.99",
        :longtitude => "9.99",
        :gnis => "Gnis",
        :fips => "Fips",
        :msa => 1,
        :usa => 2,
        :cbsa => 3,
        :csa => 4,
        :psa => 5,
        :dma => 6
      ),
      stub_model(City,
        :belongs_to => "",
        :belongs_to => "",
        :name => "Name",
        :latitude => "9.99",
        :longtitude => "9.99",
        :gnis => "Gnis",
        :fips => "Fips",
        :msa => 1,
        :usa => 2,
        :cbsa => 3,
        :csa => 4,
        :psa => 5,
        :dma => 6
      )
    ])
  end

  it "renders a list of cities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Gnis".to_s, :count => 2
    assert_select "tr>td", :text => "Fips".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
  end
end
