require 'spec_helper'

describe "cities/edit" do
  before(:each) do
    @city = assign(:city, stub_model(City,
      :belongs_to => "",
      :belongs_to => "",
      :name => "MyString",
      :latitude => "9.99",
      :longtitude => "9.99",
      :gnis => "MyString",
      :fips => "MyString",
      :msa => 1,
      :usa => 1,
      :cbsa => 1,
      :csa => 1,
      :psa => 1,
      :dma => 1
    ))
  end

  it "renders the edit city form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cities_path(@city), :method => "post" do
      assert_select "input#city_belongs_to", :name => "city[belongs_to]"
      assert_select "input#city_belongs_to", :name => "city[belongs_to]"
      assert_select "input#city_name", :name => "city[name]"
      assert_select "input#city_latitude", :name => "city[latitude]"
      assert_select "input#city_longtitude", :name => "city[longtitude]"
      assert_select "input#city_gnis", :name => "city[gnis]"
      assert_select "input#city_fips", :name => "city[fips]"
      assert_select "input#city_msa", :name => "city[msa]"
      assert_select "input#city_usa", :name => "city[usa]"
      assert_select "input#city_cbsa", :name => "city[cbsa]"
      assert_select "input#city_csa", :name => "city[csa]"
      assert_select "input#city_psa", :name => "city[psa]"
      assert_select "input#city_dma", :name => "city[dma]"
    end
  end
end
