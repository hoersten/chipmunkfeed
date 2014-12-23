require "spec_helper"

describe SearchController, type: :routing do
  describe "routing" do

    it "routes to #search" do
      expect(get("/search")).to route_to("search#search")
      expect(post("/search")).to route_to("search#search")
    end

    it "routes to #autocomplete" do
      expect(get("/search/autocomplete")).to route_to("search#autocomplete")
    end

  end
end
