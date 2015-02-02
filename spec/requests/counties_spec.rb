require 'spec_helper'

describe "Counties", type: :request do
  describe "GET /:state/counties" do
    it "should return 200" do
      state = FactoryGirl.create(:state_with_counties)
      get state_counties_path(state)
      expect(response.status).to eq(200)
    end
  end

  describe "GET /:state/:id" do
    it "should return 200" do
      county = FactoryGirl.create(:county)
      get county_path(:state => county.state.to_param, :id => county.to_param)
      expect(response.status).to eq(200)
    end
    it "should error with invalid id" do
      county = FactoryGirl.build(:county, :county_with_invalid_id)
      expect {get county_path, { state:county.state.to_param, id: county.to_param} }.to raise_error(ActionController::RoutingError)
    end
  end

end
