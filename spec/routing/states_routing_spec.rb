require "spec_helper"

describe StatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get("/states")).to route_to("states#index")
    end

    it "routes to #show" do
      expect(get("/ohio")).to route_to("states#show", :id => "ohio")
    end

  end
end
