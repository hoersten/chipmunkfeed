require 'spec_helper'

describe "Cities", type: :request do
  describe "GET /cities" do
    it "works! (now write some real specs)" do
      state = FactoryGirl.create(:state)
      get state_cities_path(state)
      expect(response.status).to eq(200)
    end
  end
end
