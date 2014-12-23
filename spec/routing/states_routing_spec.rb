require "spec_helper"

describe StatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get("/states")).to route_to("states#index")
    end

    it "routes to #new" do
      expect(get("/states/new")).to route_to("states#new")
    end

    it "routes to #show" do
      expect(get("/ohio")).to route_to("states#show", :id => "ohio")
    end

    it "routes to #edit" do
      expect(get("/states/ohio/edit")).to route_to("states#edit", :id => "ohio")
    end

    it "routes to #create" do
      expect(post("/states")).to route_to("states#create")
    end

    it "routes to #update" do
      expect(put("/states/ohio")).to route_to("states#update", :id => "ohio")
    end

    it "routes to #destroy" do
      expect(delete("/states/ohio")).to route_to("states#destroy", :id => "ohio")
    end

  end
end
