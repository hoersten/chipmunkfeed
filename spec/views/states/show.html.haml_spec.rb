require 'spec_helper'

describe "states/show", type: :view do
  before(:each) do
    @state = FactoryGirl.create(:state_with_cities)
  end

  it "renders title" do
    render
    expect(rendered).to match(/<h1>[ \r\n]*#{@state.name}[ \r\n]*<\/h1>/)
  end
  it "renders basic info" do
    render
    expect(rendered).to match(/#{@state.capital.name}/)
  end
end
