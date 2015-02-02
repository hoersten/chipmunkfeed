require 'spec_helper'

describe "states/index", type: 'view' do
  before(:each) do
    assign(:states, [
      stub_model(State,
        :name => "Ohio",
        :slug => "ohio",
        :abbreviation => "OH",
        :state_id => "37",
        :fips => "39000"
      ),
      stub_model(State,
        :name => "Florida",
        :slug => "florida",
        :abbreviation => "FL",
        :state_id => "11",
        :fips => "12000"
      )
    ])
  end

  it "renders a list of states" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "ul.states>li", :count => 2
  end
end
