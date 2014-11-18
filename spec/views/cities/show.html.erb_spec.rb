require 'spec_helper'

describe "cities/show" do
  before(:each) do
    @city = assign(:city, stub_model(City,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Name/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/Gnis/)
    rendered.should match(/Fips/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/6/)
  end
end
