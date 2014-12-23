require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ApplicationHelper, type: :helper do
  describe "state_path" do
    it ".state_path" do
      state = FactoryGirl.create(:state)
      expect(state_path(state)).to eq('/' + state.slug)
    end
  end
  describe "county_path" do
    it ".county_path" do
      county = FactoryGirl.create(:county)
      expect(county_path(county)).to eq('/' + county.slug)
    end
  end
  describe "city_path" do
    it ".city_path" do
      city = FactoryGirl.create(:city)
      expect(city_path(city)).to eq('/' + city.slug)
    end
  end
end
