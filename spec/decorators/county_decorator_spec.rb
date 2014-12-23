require 'spec_helper'

describe CountyDecorator do
  describe "display_name" do
    it "display_name" do
      county = FactoryGirl.create(:county)
      sd = county.decorate
      expect(sd.display_name).to eq(county.name + ' ' + county.county_type)
    end
  end
  describe "search_display" do
    it "search_display" do
      county = FactoryGirl.create(:county)
      sd = county.decorate
      expect(sd.search_display).to eq(county.name + ' ' + county.county_type + ', ' + county.state.name)
    end
  end
end
