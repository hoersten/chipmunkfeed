require "spec_helper"

describe CitiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get("/ohio/cities")).to route_to("cities#index", :state => 'ohio')
      expect(get("/ohio/allen-county/cities")).to route_to("cities#index", :state => 'ohio', :county => 'allen-county')
    end

    it "routes to #new" do
      expect(get("/cities/new")).to route_to("cities#new")
    end

    it "routes to #show" do
      expect(get("/ohio/columbus")).to route_to("cities#show", :id => "columbus", :state => 'ohio')
    end

    it "routes to #edit" do
      expect(get("/cities/1/edit")).to route_to("cities#edit", :id => "1")
    end

    it "routes to #create" do
      expect(post("/cities")).to route_to("cities#create")
    end

    it "routes to #update" do
      expect(put("/cities/1")).to route_to("cities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete("/cities/1")).to route_to("cities#destroy", :id => "1")
    end

  end
end
