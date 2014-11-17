require 'spec_helper'

describe "states/edit" do
  before(:each) do
    @state = assign(:state, stub_model(State,
      :name => "MyString",
      :abbreviation => "MyString",
      :state_id => "",
      :fips => "MyString"
    ))
  end

  it "renders the edit state form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => states_path(@state), :method => "post" do
      assert_select "input#state_name", :name => "state[name]"
      assert_select "input#state_abbreviation", :name => "state[abbreviation]"
      assert_select "input#state_state_id", :name => "state[state_id]"
      assert_select "input#state_fips", :name => "state[fips]"
    end
  end
end
