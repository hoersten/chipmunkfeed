require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the CountiesHelper. For example:
#
# describe CountiesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe CountiesHelper, type: :helper do
  describe "county_cities_path" do
    it "county_cities_path" do
      county = FactoryGirl.create(:county)
      expect(county_cities_path(county)).to eq('/' + county.slug + '/cities')
    end
  end
end
