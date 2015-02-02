require 'spec_helper'

describe "States", type: :request do
  describe "GET /states" do
    it "should return 200" do
      get states_path
      expect(response.status).to eq(200)
    end
  end

  describe "GET /:id" do
    it "should return 200" do
      state = FactoryGirl.create(:state)
      get state_path(state)
      expect(response.status).to eq(200)
    end
    it "should error with invalid id" do
      state = FactoryGirl.build(:state, :state_with_invalid_id)
      expect {get state_path(state)}.to raise_error(ActionController::RoutingError)
    end
  end

end
