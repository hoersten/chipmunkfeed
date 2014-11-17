require 'spec_helper'

describe "states/show" do
  before(:each) do
    @state = assign(:state, stub_model(State,
      :name => "Name",
      :abbreviation => "Abbreviation",
      :state_id => "",
      :fips => "Fips"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Abbreviation/)
    rendered.should match(//)
    rendered.should match(/Fips/)
  end
end
