require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the StatesHelper. For example:
#
# describe StatesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe StatesHelper, type: :helper do
  describe "state_cities_path" do
    it "state_cities_path" do
      state = FactoryGirl.create(:state)
      expect(state_cities_path(state)).to eq('/' + state.slug + '/cities')
    end
  end
  describe "state_counties_path" do
    it "state_counties_path" do
      state = FactoryGirl.create(:state)
      expect(state_counties_path(state)).to eq('/' + state.slug + '/counties')
    end
  end
end
