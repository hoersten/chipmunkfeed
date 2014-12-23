require 'spec_helper'

describe StateDecorator do
  describe "display_name" do
    it "display_name" do
      state = FactoryGirl.create(:state)
      sd = state.decorate
      expect(sd.display_name).to eq(state.name)
    end
  end
  describe "search_display" do
    it "search_display" do
      state = FactoryGirl.create(:state)
      sd = state.decorate
      expect(sd.search_display).to eq(state.name)
    end
  end
end
